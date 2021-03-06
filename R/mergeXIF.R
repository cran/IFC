################################################################################
# This file is released under the GNU General Public License, Version 3, GPL-3 #
# Copyright (C) 2020 Yohann Demont                                             #
#                                                                              #
# It is part of IFC package, please cite:                                      #
# -IFC: An R Package for Imaging Flow Cytometry                                #
# -YEAR: 2020                                                                  #
# -COPYRIGHT HOLDERS: Yohann Demont, Gautier Stoll, Guido Kroemer,             #
#                     Jean-Pierre Marolleau, Loïc Garçon,                      #
#                     INSERM, UPD, CHU Amiens                                  #
#                                                                              #
# DISCLAIMER:                                                                  #
# -You are using this package on your own risk!                                #
# -We do not guarantee privacy nor confidentiality.                            #
# -This program is distributed in the hope that it will be useful, but WITHOUT #
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or        #
# FITNESS FOR A PARTICULAR PURPOSE. In no event shall the copyright holders or #
# contributors be liable for any direct, indirect, incidental, special,        #
# exemplary, or consequential damages (including, but not limited to,          #
# procurement of substitute goods or services; loss of use, data, or profits;  #
# or business interruption) however caused and on any theory of liability,     #
# whether in contract, strict liability, or tort (including negligence or      #
# otherwise) arising in any way out of the use of this software, even if       #
# advised of the possibility of such damage.                                   #
#                                                                              #
# You should have received a copy of the GNU General Public License            #
# along with IFC. If not, see <http://www.gnu.org/licenses/>.                  #
################################################################################

#' @title RIF/CIF File Merging
#' @description
#' Merges RIF or CIF files.
#' @param fileName paths of files to merge.
#' All files have to be either '.rif' or '.cif' files.
#' All files should have same channels.
#' @param write_to pattern used to export file.
#' Placeholders, like "\%d/\%s_fromR.\%e", will be substituted:\cr
#' -\%d: with full path directory of first element of 'fileName'\cr
#' -\%p: with first parent directory of first element of 'fileName'\cr
#' -\%e: with extension of 'fileName' (without leading .)\cr
#' -\%s: with shortname from of first element of 'fileName' (i.e. basename without extension).\cr
#' Exported file extension will be deduced from this pattern. It has to be the same as 'fileName', i.e. .cif or .rif.
#' @param extract_features whether to try to extract features. Default is FALSE. Not yet implemented.
#' @param endianness the endian-ness ("big" or "little") of the target system for the file. Default is .Platform$endian.\cr
#' Endianness describes the bytes order of data stored within the files. This parameter may not be modified.
#' @param verbose whether to display information (use for debugging purpose). Default is FALSE.
#' @param verbosity quantity of information displayed when verbose is TRUE; 1: normal, 2: rich. Default is 1.
#' @param overwrite whether to overwrite file or not. Default is FALSE.\cr
#' Note that if TRUE, it will overwrite exported file if paths of files in 'fileName' and deduced from 'write_to' arguments are different.
#' Otherwise, you will get an error saying that overwritting source file is not allowed.\cr
#' Note also that an original file, i.e. generated by IDEAS(R) or INSPIRE(R), will never be overwritten.
#' Otherwise, you will get an error saying that overwritting original file is not allowed.\cr
#' @param display_progress whether to display a progress bar. Default is TRUE.
#' @param ... other arguments to be passed.
#' @return It invisibly returns full path of exported file.
#' @keywords internal
mergeXIF <- function (fileName, write_to,
                      extract_features = FALSE, endianness = .Platform$endian, verbose = FALSE, verbosity = 1, 
                      overwrite = FALSE, display_progress = TRUE, ...) {
  dots = list(...)
  # change locale
  locale_back = Sys.getlocale("LC_ALL")
  on.exit(suppressWarnings(Sys.setlocale("LC_ALL", locale = locale_back)), add = TRUE)
  suppressWarnings(Sys.setlocale("LC_ALL", locale = "English"))
  
  # check madatory param
  if(missing(fileName)) stop("'fileName' can't be missing")
  tmp = duplicated(fileName)
  if(any(tmp)) {
    warning(paste0("duplicated files have been removed from 'fileName': ","\n-", paste0(fileName[tmp],collapse="\n-")), call. = FALSE, immediate. = TRUE)
    fileName = fileName[!tmp]
  }
  if(length(fileName) < 2) stop("'fileName' should be at least of length 2 to create a merge")
  tmp = file.exists(fileName)
  if(!all(tmp)) stop(paste0(paste0("'fileName', can't find file",ifelse(sum(!tmp) > 1, "s:", ":")),"\n-", paste0(fileName[!tmp],collapse="\n-")))
  tmp = unique(getFileExt(fileName))
  if(length(tmp) != 1) stop("all files in 'fileName' should have same extension")
  tryCatch({
    tmp = unique(sapply(fileName, cpp_checkTIFF))
  }, error = function(e) {
    stop(e$message, call. = FALSE)
  })
  if(length(unique(tmp)) != 1) stop("can't deal with files in 'fileName' with different endianness")
  
  fileName = normalizePath(fileName, winslash = "/", mustWork = FALSE)
  file_first = fileName[1]
  
  # no check on illumination
  # check on channels
  tmp = lapply(fileName, FUN = function(f) {
    IFD = getIFD(fileName = f, offsets = "first", verbose = verbose, verbosity = verbosity, bypass = TRUE)
    tmp_acq = read_xml(getFullTag(IFD = IFD, which = 1, "33027"), options=c("HUGE","RECOVER","NOENT","NOBLANKS","NSCLEAN"))
    as.logical(as.numeric(unlist(strsplit( xml_text(xml_find_first(tmp_acq, "//Imaging//ChannelInUseIndicators_0_11")), " ", useBytes = TRUE, fixed = TRUE))))
  })
  if(!do.call(what = "all.equal.list", args = tmp)) stop("files in 'fileName' have been acquired with different channels")
  
  
  if(missing(write_to)) stop("'write_to' can't be missing")
  extract_features = as.logical(extract_features); assert(extract_features, len = 1, alw = c(TRUE, FALSE))
  display_progress = as.logical(display_progress); assert(display_progress, len = 1, alw = c(TRUE, FALSE))
  verbose = as.logical(verbose); assert(verbose, len = 1, alw = c(TRUE, FALSE))
  if(verbose) {
    verbosity = as.integer(verbosity); assert(verbosity, len = 1, alw = c(1,2))
    VER = ifelse(verbose & (verbosity==2), TRUE, FALSE)
  } else {
    VER = FALSE
  }
  
  r_endian = cpp_checkTIFF(file_first)
  f_Ext = getFileExt(file_first)
  assert(write_to, len = 1, typ = "character")
  splitf_obj = splitf(file_first)
  splitp_obj = splitp(write_to)
  write_to = formatn(splitp_obj, splitf_obj)
  e_Ext = getFileExt(write_to); assert(e_Ext, len = 1, alw = c("cif", "rif"))
  if(f_Ext != e_Ext) stop("'fileName' and 'write_to' should have same extension")
  if(any(splitp_obj$channel > 0)) message("'write_to' has %c argument but channel information can't be retrieved with mergeXIF()")
  if(any(splitp_obj$object > 0)) message("'write_to' has %o argument but channel information can't be retrieved with mergeXIF()")
  dir_name = dirname(write_to)
  if(!dir.exists(dir_name)) if(!dir.create(dir_name, recursive = TRUE, showWarnings = FALSE)) stop(paste0("can't create\n", dir_name))
  
  overwritten = FALSE
  if(file.exists(write_to)) {
    write_to = normalizePath(write_to, winslash = "/", mustWork = FALSE)
    if(!overwrite) stop(paste0("file ", write_to, " already exists"))
    if(any(tolower(fileName) %in% tolower(write_to))) stop("you are trying to overwrite source file which is not allowed")
    tryCatch({
      IFD_export = getIFD(fileName = write_to, offsets = "first", force_trunc = TRUE, trunc_bytes = 4, verbose = verbose, verbosity = verbosity, bypass = TRUE)[[1]] 
    }, error = function(e) {
      stop(paste0(write_to, "\ndoes not seem to be well formatted:\n", e$message), call. = FALSE)
    })
    if(length(IFD_export$tags[["33090"]])==0) stop("you are trying to overwrite an original file which is not allowed")
    tmp_file = tempfile()
    overwritten = TRUE
  }
  file_w = ifelse(overwritten, tmp_file, write_to)
  title_progress = basename(write_to)
  
  # # extract features from files
  # feat = try(lapply(files, FUN = function(f) {
  #   suppressWarnings(ExtractFromXIF(fileName = f, extract_features = TRUE, extract_images = FALSE, 
  #                   extract_offsets = FALSE, extract_stats = TRUE, verbose = verbose, 
  #                   verbosity = verbosity, display_progress = TRUE,
  #                   fast = TRUE, recursive = TRUE)$features)
  # }))
  # str(feat)
  
  # unwanted tags
  # 33004 corresponds to file date
  # 33005 corresponds to user
  # 33018 corresponds to total object number
  # 33029 corresponds to merged files in CIF, will be removed since new subset file can't contain this tag
  # 33030 corresponds to merged files in RIF, will be removed since new subset file can't contain this tag
  # 33080 corresponds to offset of Features values, will be overwritten if features are found
  # 33081 appears in merged file, it has same val = 33080, but is of typ = 2 and map NULL 
  # 33082 corresponds to binary Features version, will be overwritten if features are found
  # 33083 corresponds to Features values in merged or subset
  # 33090, 33091, 33092, 33093, 33094 corresponds to tags we add to track objects origin
  unwanted = c(33004, 33005, 33018, 33029, 33030, 33080, 33081, 33082, 33083, 33090, 33091, 33092, 33093, 33094)

  # tags of StripOffsets (273) and TileOffsets (324)
  off_tags = c(273, 324)
  
  # open connection for writing
  tryCatch(suppressWarnings({
    towrite = file(description = file_w, open = "wb")
  }), error = function(e) {
    stop(paste0(ifelse(overwritten,"temp ","'write_to' "), "file: ", file_w, "\ncan't be created: check name ?"))
  })
  write_to = normalizePath(write_to, winslash = "/", mustWork = FALSE)
  tryCatch(expr = {
    # magic number
    if(r_endian == "little") {
      writeBin(object = c(packBits(intToBits(18761))[1:2], packBits(intToBits(42))[1:2]), con = towrite, endian = r_endian)
    } else {
      writeBin(object = c(packBits(intToBits(19789))[1:2], rev(packBits(intToBits(42))[1:2])), con = towrite, endian = r_endian)
    }
    # define writing position
    pos = 4
    
    # extract information from first IFD of first file
    IFD_first = getIFD(fileName = file_first, offsets = "first", trunc_bytes = 4, force_trunc = TRUE, verbose = verbose, verbosity = verbosity, bypass = TRUE)
    N = names(IFD_first[[1]]$tags)
    if(display_progress) pb1 = newPB(session = dots$session, title = title_progress, label = "extracting 1st IFD", min = 0, max = length(IFD_first[[1]]$tags), initial = 0, style = 3)
    toread = file(description = file_first, open = "rb")
    tryCatch({
      # go to IFD start
      seek(toread, IFD_first[[1]]$curr_IFD_offset)
      # read number of directory entries
      readBin(toread, what = "raw", n = 2, endian = r_endian)
      ifd = sapply(IFD_first[[1]]$tags, simplify = FALSE, FUN=function(i_tag) {
        add_content = raw()
        # read entry
        min_content = readBin(toread, what = "raw", n = 12, endian = r_endian)
        # save current position in read
        r_pos = seek(toread)
        # remove unwanted tags
        if(i_tag$tag %in% unwanted) return(list(min_content = raw(), add_content = raw()))
        # extract extra content when value is an offset
        if(i_tag$off) {
          # go to this offset in read
          seek(toread, i_tag$val)
          # extra content
          add_content = readBin(toread, what = "raw", n = i_tag$byt, endian = r_endian)
          # go to former position in read
          seek(toread, r_pos)
        }
        return(list(min_content = min_content, add_content = add_content))
      })
      # # extract raw content from 1st IFD
      # ifd = do.call(what = "c",
      #               args = c(lapply(1:length(N), FUN=function(i_tag) {
      #                 if(as.integer(N[i_tag]) %in% unwanted) return(NULL)
      #                 foo = getFullTag(IFD_first, which = 1, tag = i_tag)
      #                 buildIFD(val = foo, typ = IFD_first[[1]]$tags[[i_tag]]$typ, tag = N[i_tag], endianness = r_endian)
      #               }), list(ifd_obj, ifd_merged, ifd_version, ifd_checksum)))
    }, error = function(e) {
      stop(paste0("can't create first IFD:\n", e$message), call. = FALSE) 
    }, finally = {
      if(display_progress) endPB(pb1)
      close(toread)
    })
    
    # set additional IFD
    # 33029 or 33030 names of files that constitute the merge
    if(f_Ext == "rif") {
      ifd_merged = buildIFD(val = paste0(normalizePath(fileName, winslash = "\\"), collapse = "|"), typ = 2, tag = 33030, endianness = r_endian)
    } else {
      ifd_merged = buildIFD(val = paste0(normalizePath(fileName, winslash = "\\"), collapse = "|"), typ = 2, tag = 33029, endianness = r_endian)
    }
    # 33004 now time
    ifd_time = buildIFD(val = format(Sys.time(), "%d-%m-%Y %H:%M:%S %p"), typ = 2, tag = 33004, endianness = r_endian)
    # 33005 user
    ifd_user = buildIFD(val = "IFC package", typ = 2, tag = 33005, endianness = r_endian)
    # compute final object number
    final_obj = sum(sapply(fileName, FUN = function(f) getFullTag(IFD = getIFD(fileName = f, offsets = "first", trunc_bytes = 4, force_trunc = TRUE, verbose = verbose, verbosity = verbosity, bypass = TRUE), which = 1, tag = "33018")))
    ifd_obj = buildIFD(val = final_obj, typ = 4, tag = 33018, endianness = r_endian)
    # 33090 ifc pkg version
    ifd_version = buildIFD(val = paste0(unlist(packageVersion("IFC")), collapse = "."), typ = 2, tag = 33090, endianness = r_endian)
    # 33091 names of files that constitute the merge
    ifd_files = buildIFD(val = paste0(c(suppressWarnings(getFullTag(IFD = IFD_first, which = 1, tag = "33091")),
                                        paste0(normalizePath(fileName, winslash = "\\"), collapse = "|")),
                                      collapse = ">"),
                         typ = 2, tag = 33091, endianness = r_endian)
    # 33092 checksum of each file constituting the merge
    ifd_checksum = buildIFD(val = paste0(c(suppressWarnings(getFullTag(IFD = IFD_first, which = 1, tag = "33092")),
                                           paste0(unname(sapply(fileName, cpp_checksum)), collapse = "|")),
                                         collapse = ">"), 
                            typ = 2, tag = 33092, endianness = r_endian)
    
    # remove unwanted tags
    ifd = ifd[sapply(ifd, FUN=function(i_tag) length(i_tag$min_content)!=0)]
    
    # add extra ifd
    ifd = c(ifd, ifd_time, ifd_user, ifd_obj, ifd_merged, ifd_version, ifd_files, ifd_checksum)

    # reorder ifd
    ifd = ifd[order(as.integer(names(ifd)))]
    
    # define new offset position of current ifd
    l_min = cumsum(sapply(ifd, FUN=function(i_tag) length(i_tag$min_content)))
    l_add = cumsum(sapply(ifd, FUN=function(i_tag) length(i_tag$add_content)))
    
    # write this new offset
    pos = pos + 4
    tmp = packBits(intToBits(pos + l_add[length(l_add)]), type="raw")
    if(endianness != r_endian) tmp = rev(tmp)
    writeBin(object = tmp, con = towrite, endian = r_endian)
    
    # write all additional content
    # TODO writing all additionnal content can be long, add a progress bar here ?
    writeBin(object = unlist(lapply(ifd, FUN=function(i_tag) i_tag$add_content)), con = towrite, endian = r_endian)
    
    # modify number of directory entries
    n_entries = length(ifd)
    tmp = packBits(intToBits(n_entries),type="raw")
    if(endianness!=r_endian) tmp = rev(tmp)
    
    # write modified number of entries
    writeBin(object = tmp[1:2], con = towrite, endian = r_endian)
    
    # modify ifd val/offset of minimal content 
    for(i in 1:length(ifd)) {
      la = length(ifd[[i]]$add_content)
      if(la==0) next
      tmp = packBits(intToBits(pos),type="raw")
      if(endianness!=r_endian) tmp = rev(tmp)
      ifd[[i]]$min_content[9:12] <- tmp
      pos = pos + la
    }
    
    # write ifd
    writeBin(object = unlist(lapply(ifd, FUN=function(i_tag) i_tag$min_content)), con = towrite, endian = r_endian)
    pos = pos + l_min[length(l_min)] + 2

    if(display_progress) {
      pb2 = newPB(session = dots$session, title = title_progress, label = " ", min = 0, max = final_obj * 2, initial = 0, style = 3)
      on.exit(endPB(pb2), add = TRUE)
    }
    
    # initialize object count
    off_obj = 0
    # repeat same process for img / msk data for all files
    for(f in fileName) {
      IFD_first = getIFD(fileName = f, offsets = "first", trunc_bytes = 4, force_trunc = TRUE, verbose = verbose, verbosity = verbosity, bypass = TRUE)
      obj_count = 2*getFullTag(IFD = IFD_first, which = 1, tag = "33018")
      IFD = IFD_first[[1]]

      label_progress = basename(f)
      # open connections for reading
      toread = file(description = f, open = "rb")
      tryCatch({
        OBJECT_ID = NULL
        for(i_obj in 1:obj_count) {
          cum_obj = i_obj + off_obj
          setPB(pb = pb2, value = cum_obj, title = title_progress, label = paste0(label_progress, " - merging objects"))
          # extract IFD
          IFD = cpp_getTAGS(fname = f, offset = IFD$next_IFD_offset, trunc_bytes = 8, force_trunc = FALSE, verbose = VER)
          cur_obj = IFD$infos
          if(cur_obj$TYPE == 2) OBJECT_ID = cur_obj$OBJECT_ID
          # extract raw content from current IFD
          # bar = list(IFD)
          # class(bar) <- "IFC_ifd_list"
          # attr(bar, "fileName_image") <- f
          # ifd = do.call(what = "c",
          #               args = c(lapply(names(IFD$tags), FUN=function(i_tag) {
          #                 if(as.integer(i_tag) %in% unwanted) return(NULL)
          #                 foo = getFullTag(IFD = bar, which = 1, tag = i_tag)
          #                 res = buildIFD(val = foo, typ = IFD$tags[[i_tag]]$typ, tag = i_tag, endianness = r_endian)
          #                 if(i_tag %in% off_tags) {
          #                   seek(toread, where = IFD$tags[[i_tag]]$val, origin = "start")
          #                   if(i_tag == "273") res[[1]]$add_content = readBin(toread, what = "raw", n = IFD$tags[["279"]]$map, endian = r_endian)
          #                   if(i_tag == "324") res[[1]]$add_content = readBin(toread, what = "raw", n = IFD$tags[["325"]]$map, endian = r_endian)
          #                 }
          #                 res
          #               })))
          
          # go to IFD start
          seek(toread, IFD$curr_IFD_offset)
          # read number of directory entries
          readBin(toread, what = "raw", n = 2, endian = r_endian)
          ifd = sapply(IFD$tags, simplify = FALSE, FUN=function(i_tag) {
            add_content = raw()
            # read entry
            min_content = readBin(toread, what = "raw", n = 12, endian = r_endian)
            # save current position in read
            r_pos = seek(toread)
            # remove unwanted tags
            if(i_tag$tag %in% unwanted) return(list(min_content = raw(), add_content = raw()))
            # extract extra content when value is an offset
            if(i_tag$off || (i_tag$tag %in% off_tags)) {
              # go to this offset in read
              seek(toread, i_tag$val)
              # extra content
              if(i_tag$tag %in% off_tags) {
                if(i_tag$tag == 273) add_content = readBin(toread, what = "raw", n = IFD$tags[["279"]]$map, endian = r_endian)
                if(i_tag$tag == 324) add_content = readBin(toread, what = "raw", n = IFD$tags[["325"]]$map, endian = r_endian)
              } else {
                add_content = readBin(toread, what = "raw", n = i_tag$byt, endian = r_endian)
              }
              # go to former position in read
              seek(toread, r_pos)
            }
            return(list(min_content = min_content, add_content = add_content))
          })
          
          # remove unwanted tags
          ifd = ifd[sapply(ifd, FUN=function(i_tag) length(i_tag$min_content)!=0)]
          
          # register current object id in new tag to be able to track it
          ifd = c(ifd, buildIFD(val = paste0(c(suppressWarnings(getFullTag(IFD = structure(list(IFD), class = "IFC_ifd_list", "fileName_image" = f), which = 1, tag = "33093")),
                                               OBJECT_ID),
                                             collapse = ">"),
                                typ = 2, tag = 33093, endianness = r_endian))
          # add origin fileName to allow to track where exported objects are coming from
          ifd = c(ifd, buildIFD(val = paste0(c(suppressWarnings(getFullTag(IFD = structure(list(IFD), class = "IFC_ifd_list", "fileName_image" = f), which = 1, tag = "33094")),
                                               f),
                                             collapse = ">"),
                                typ = 2, tag = 33094, endianness = r_endian))
          
          # modify object id
          tmp = packBits(intToBits(floor(cum_obj/2)),type="raw")
          if(endianness!=r_endian) tmp = rev(tmp)
          
          # TODO ask amnis what to do with 33024
          if(length(ifd[["33024"]])!=0) {
            if(length(ifd[["33003"]])!=0) {
              ifd[["33024"]]$min_content[9:12] <- ifd[["33003"]]$min_content[9:12]
            }
          }
          if(length(ifd[["33003"]])!=0) ifd[["33003"]]$min_content[9:12] <- tmp
          
          # reorder ifd
          ifd = ifd[order(as.integer(names(ifd)))]
          
          # define new offset position of current ifd
          l_min = cumsum(sapply(ifd, FUN=function(i_tag) length(i_tag$min_content)))
          l_add = cumsum(sapply(ifd, FUN=function(i_tag) length(i_tag$add_content)))
          
          # write this new offset
          pos = pos + 4
          tmp = packBits(intToBits(pos + l_add[length(l_add)]), type="raw")
          if(endianness != r_endian) tmp = rev(tmp)
          writeBin(object = tmp, con = towrite, endian = r_endian)

          # write all additional content
          writeBin(object = unlist(lapply(ifd, FUN=function(i_tag) i_tag$add_content)), con = towrite, endian = r_endian)

          # modify number of directory entries
          n_entries = length(ifd)
          tmp = packBits(intToBits(n_entries),type="raw")
          if(endianness!=r_endian) tmp = rev(tmp)
          
          # write modified number of entries
          writeBin(object = tmp[1:2], con = towrite, endian = r_endian)
          
          # modify ifd val/offset of minimal content 
          for(i in 1:length(ifd)) {
            la = length(ifd[[i]]$add_content)
            if(la==0) next
            tmp = packBits(intToBits(pos),type="raw")
            if(endianness!=r_endian) tmp = rev(tmp)
            ifd[[i]]$min_content[9:12] <- tmp
            pos = pos + la
          }
          
          # write ifd
          writeBin(object = unlist(lapply(ifd, FUN=function(i_tag) i_tag$min_content)), con = towrite, endian = r_endian)
          pos = pos + l_min[length(l_min)] + 2
        }
      }, error = function(e) {
        stop(e$message, call. = FALSE)
      }, finally = {
        close(toread)
      })
      off_obj = off_obj + obj_count
    }
    writeBin(object = packBits(intToBits(0),type="raw"), con = towrite, endian = r_endian)
  }, error = function(e) {
    close(towrite)
    stop(paste0("Can't create 'write_to' file.\n", write_to,
                ifelse(overwritten,"\nFile was not modified.\n","\n"),
                "See pre-file @\n", normalizePath(file_w, winslash = "/", mustWork = FALSE), "\n",
                e$message), call. = FALSE)
  })
  close(towrite)
  if(overwritten) {
    mess = paste0("\n######################\n", write_to, "\nhas been successfully overwritten\n")
    if(!suppressWarnings(file.rename(to = write_to, from = file_w))) { # try file renaming which is faster
      if(!file.copy(to = write_to, from = file_w, overwrite = TRUE)) { # try file.copy if renaming is not possible
        stop(paste0("Can't copy temp file@\n", normalizePath(file_w, winslash = "/"), "\n",
                    "Can't create 'write_to' file.\n", write_to,
                    "\nFile was not modified.\n"), call. = FALSE)
      } else {
        file.remove(file_w, showWarnings = FALSE)
      }
    }
  } else {
    mess = paste0("\n######################\n", write_to, "\nhas been successfully exported\n")
  }
  message(mess)
  return(invisible(write_to))
}
