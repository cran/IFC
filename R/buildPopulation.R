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

#' @title IFC Population Coercion
#' @description
#' Helper to build a list to allow population export.
#' @param name name of the population.
#' @param type type of population. Either "B", "C", "G" or "T" for Base, Combined, Graphical or Tagged, respectively.\cr
#' If missing, the default, 'type' will be deduced from other parameters.
#' If 'name' is "All" type will be "B". Otherwise, if 'fx' is given type will be "G".
#' Otherwise, "T", if 'definition' is missing but not 'obj' or "C" if 'definition' is not missing.
#' @param base which population is based on. It will be base="All", for 'type' "T" and "C" and base="", for 'type' "B". It is only needed when type = "G".
#' @param color color of the population. See \code{\link{paletteIFC}} for allowed colors. If not provided, it will be sampled. 
#' @param lightModeColor lightModeColor of the population. See \code{\link{paletteIFC}} for allowed colors. If not provided, it will be sampled.
#' @param style style of the population. Either 20, 4, 3, 1, 5, 0, 2, 18, 15, 17, respectively for:
#' "Simple Dot", "Cross", "Plus", "Empty Circle", "Empty Diamond", "Empty Square",
#' "Empty Triangle", "Solid Diamond", "Solid Square", "Solid Triangle".
#' @param region Only if type="G". Name of the region defining the population.
#' @param fx Only needed if type="G". Name of the x-feature defining the population.
#' @param fy Only needed if type="G" and only if region is defined in 2D. Name of the y-feature defining the population. 
#' @param definition Only needed if type="C". Parameters defining the population.
#' @param obj Only needed if type="T". Either a:\cr
#' -Logical vector of same length as "All" population indicating if a cell belongs to the population or not.\cr
#' -Integer vector of indices of cells that belongs to the population. Note that first object is 0.
#' @param ... Other arguments to be passed.
#' @return a list containing all population information.
#' @export
buildPopulation <- function(name, type, base="All", color, lightModeColor, style, region, fx, fy, definition, obj, ...) {
  dots = list(...)
  if(missing(name)) stop("'name' can't be missing")
  assert(name, len=1, typ="character")
  if(missing(type)) {
    type = ""
    if(missing(fx)) {
      if(missing(definition)) {
        if(!missing(obj)) type="T"
      } else{
        type="C"
      }
    } else {
      if(missing(obj) & missing(definition)) type="G"
    }
    if(name=="All") type="B"
  }
  assert(type, len=1)
  if(name=="All" && type!="B") stop("when 'name' is \"All\", 'type' has to be \"B\"")
  # back compatible with old R version, no need for accuracy since it is just for electing a color/style
  SEED = fetch_seed(list(pseudo_seed(name), "Mersenne-Twister", "Inversion", "Rounding"))
  f = function(x) { 
    suppressWarnings(with_seed(x, SEED$seed, SEED$kind, SEED$normal.kind, SEED$sample.kind))
  }
  if(missing(color)) {
    if(missing(lightModeColor)) {
      tmp = f(sample(nrow(paletteIFC("")),1))
      if(type == "B") color = "White"
    } else {
      assert(lightModeColor, len=1, alw=unlist(paletteIFC("")))
      tmp = which(paletteIFC("")%in%lightModeColor, arr.ind=TRUE)[1]
      if(is.na(tmp)) tmp = f(sample(nrow(paletteIFC("")),1))
    }
    color = paletteIFC("")$color[tmp]
    lightModeColor = paletteIFC("")$lightModeColor[tmp]
  } else {
    if(color%in%paletteIFC("")$color_R) color = paletteIFC("")$color[color==paletteIFC("")$color_R][1]
    assert(color, len=1, alw=paletteIFC("palette"))
  }
  if(missing(lightModeColor)) {
    if(missing(color)) {
      tmp = f(sample(nrow(paletteIFC("")),1))
      if(type == "B") lightModeColor = "Black"
    } else {
      assert(color, len=1, alw=unlist(paletteIFC("")))
      tmp = which(color==paletteIFC(""), arr.ind=TRUE)[1]
      if(is.na(tmp)) tmp = f(sample(nrow(paletteIFC("")),1))
    }
    color = paletteIFC("")$color[tmp]
    lightModeColor = paletteIFC("")$lightModeColor[tmp]
  } else {
    if(lightModeColor%in%paletteIFC("")$lightModeColor_R) lightModeColor = paletteIFC("")$lightModeColor[lightModeColor==paletteIFC("")$lightModeColor_R][1]
    assert(lightModeColor, len=1, alw=paletteIFC("palette"))
  }
  tmp_style = c(20, 4, 3, 1, 5, 0, 2, 18, 15, 17)
  names(tmp_style)=c("Simple Dot","Cross","Plus","Empty Circle","Empty Diamond","Empty Square","Empty Triangle","Solid Diamond","Solid Square","Solid Triangle")
  if(missing(style)) {
    style = f(names(sample(tmp_style, 1)))
    if(type == "B") style = "Simple Dot"
  } else {
    foo = suppressWarnings(as.integer(style))
    if(foo%in%tmp_style) style = names(tmp_style[which(foo==tmp_style)][1])
    if(style%in%names(tmp_style)) {
      style = names(tmp_style[which(style==names(tmp_style))][1])
    } else {
      style = f(names(sample(tmp_style, 1)))
    }
  }
  assert(style, len=1, alw=names(tmp_style))
  switch(type,
         "B" = {
           return(list("name"="All","type"="B","base"="","color"=color,"lightModeColor"=lightModeColor,"style"=style))
         },
         "T" = {
           if(missing(obj)) stop("'obj' can't be missing when type='T'")
           if(length(obj)!=0) if(!any(class(obj)%in%c("logical","numeric","integer"))) stop("when type='T', 'obj' has to be a logical or a numeric/integer vector")
           return(list("name"=name,"type"=type,"base"="All","color"=color,"lightModeColor"=lightModeColor,"style"=style,"obj"=obj))
         }, "G" = {
           if(missing(region)) stop("'region' can't be missing when type='G'")
           assert(region, len=1, typ="character")
           if(missing(fx)) stop("'fx' can't be missing when type='G'")
           assert(fx, len=1, typ="character")
           ret = list("name"=name,"type"=type,"base"=base,"color"=color,"lightModeColor"=lightModeColor,"style"=style,"region"=region,"fx"=fx)
           if(missing(fy)) return(ret)
           if(length(fy)==0) return(ret)
           assert(fy, len=1, typ="character")
           return(c(ret, list("fy"=fy)))
         }, "C" = {
           if(missing(definition)) stop("'definition' can't be missing when type='C'")
           assert(definition, len=1, typ="character")
           return(list("name"=name,"type"=type, "base"="All", "color"=color,"lightModeColor"=lightModeColor,"style"=style,"definition"=definition))
         },
         stop("'type' is not valid. Allowed values are \"B\", \"C\", \"G\", \"T\""))
}
