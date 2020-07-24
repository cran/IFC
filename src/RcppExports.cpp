// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// cpp_assert
Rcpp::LogicalVector cpp_assert(RObject x, Rcpp::Nullable<Rcpp::IntegerVector> len, Rcpp::Nullable<Rcpp::CharacterVector> cla, Rcpp::Nullable<Rcpp::CharacterVector> typ, RObject alw, Rcpp::CharacterVector fun);
RcppExport SEXP _IFC_cpp_assert(SEXP xSEXP, SEXP lenSEXP, SEXP claSEXP, SEXP typSEXP, SEXP alwSEXP, SEXP funSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< RObject >::type x(xSEXP);
    Rcpp::traits::input_parameter< Rcpp::Nullable<Rcpp::IntegerVector> >::type len(lenSEXP);
    Rcpp::traits::input_parameter< Rcpp::Nullable<Rcpp::CharacterVector> >::type cla(claSEXP);
    Rcpp::traits::input_parameter< Rcpp::Nullable<Rcpp::CharacterVector> >::type typ(typSEXP);
    Rcpp::traits::input_parameter< RObject >::type alw(alwSEXP);
    Rcpp::traits::input_parameter< Rcpp::CharacterVector >::type fun(funSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_assert(x, len, cla, typ, alw, fun));
    return rcpp_result_gen;
END_RCPP
}
// cpp_M_HSV2RGB
NumericVector cpp_M_HSV2RGB(const NumericMatrix mat, const double h, const double s);
RcppExport SEXP _IFC_cpp_M_HSV2RGB(SEXP matSEXP, SEXP hSEXP, SEXP sSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const NumericMatrix >::type mat(matSEXP);
    Rcpp::traits::input_parameter< const double >::type h(hSEXP);
    Rcpp::traits::input_parameter< const double >::type s(sSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_M_HSV2RGB(mat, h, s));
    return rcpp_result_gen;
END_RCPP
}
// cpp_ell_coord
NumericVector cpp_ell_coord(const NumericVector bound_x, const NumericVector bound_y);
RcppExport SEXP _IFC_cpp_ell_coord(SEXP bound_xSEXP, SEXP bound_ySEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const NumericVector >::type bound_x(bound_xSEXP);
    Rcpp::traits::input_parameter< const NumericVector >::type bound_y(bound_ySEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_ell_coord(bound_x, bound_y));
    return rcpp_result_gen;
END_RCPP
}
// cpp_pnt_in_gate
LogicalVector cpp_pnt_in_gate(const NumericMatrix pnts, const NumericMatrix gate, const int algorithm, const double epsilon);
RcppExport SEXP _IFC_cpp_pnt_in_gate(SEXP pntsSEXP, SEXP gateSEXP, SEXP algorithmSEXP, SEXP epsilonSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const NumericMatrix >::type pnts(pntsSEXP);
    Rcpp::traits::input_parameter< const NumericMatrix >::type gate(gateSEXP);
    Rcpp::traits::input_parameter< const int >::type algorithm(algorithmSEXP);
    Rcpp::traits::input_parameter< const double >::type epsilon(epsilonSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_pnt_in_gate(pnts, gate, algorithm, epsilon));
    return rcpp_result_gen;
END_RCPP
}
// cpp_scanFirst
size_t cpp_scanFirst(const std::string fname, const std::string target, const size_t start, const size_t end, const uint8_t buf_size);
RcppExport SEXP _IFC_cpp_scanFirst(SEXP fnameSEXP, SEXP targetSEXP, SEXP startSEXP, SEXP endSEXP, SEXP buf_sizeSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const std::string >::type fname(fnameSEXP);
    Rcpp::traits::input_parameter< const std::string >::type target(targetSEXP);
    Rcpp::traits::input_parameter< const size_t >::type start(startSEXP);
    Rcpp::traits::input_parameter< const size_t >::type end(endSEXP);
    Rcpp::traits::input_parameter< const uint8_t >::type buf_size(buf_sizeSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_scanFirst(fname, target, start, end, buf_size));
    return rcpp_result_gen;
END_RCPP
}
// cpp_checkTIFF
std::string cpp_checkTIFF(const std::string fname);
RcppExport SEXP _IFC_cpp_checkTIFF(SEXP fnameSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const std::string >::type fname(fnameSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_checkTIFF(fname));
    return rcpp_result_gen;
END_RCPP
}
// cpp_getoffsets_noid
IntegerVector cpp_getoffsets_noid(const std::string fname, const R_len_t obj_count, const bool display_progress, const bool verbose);
RcppExport SEXP _IFC_cpp_getoffsets_noid(SEXP fnameSEXP, SEXP obj_countSEXP, SEXP display_progressSEXP, SEXP verboseSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const std::string >::type fname(fnameSEXP);
    Rcpp::traits::input_parameter< const R_len_t >::type obj_count(obj_countSEXP);
    Rcpp::traits::input_parameter< const bool >::type display_progress(display_progressSEXP);
    Rcpp::traits::input_parameter< const bool >::type verbose(verboseSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_getoffsets_noid(fname, obj_count, display_progress, verbose));
    return rcpp_result_gen;
END_RCPP
}
// cpp_getTAGS
List cpp_getTAGS(const std::string fname, const uint32_t offset, const bool verbose, const uint8_t trunc_bytes, const bool force_trunc);
RcppExport SEXP _IFC_cpp_getTAGS(SEXP fnameSEXP, SEXP offsetSEXP, SEXP verboseSEXP, SEXP trunc_bytesSEXP, SEXP force_truncSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const std::string >::type fname(fnameSEXP);
    Rcpp::traits::input_parameter< const uint32_t >::type offset(offsetSEXP);
    Rcpp::traits::input_parameter< const bool >::type verbose(verboseSEXP);
    Rcpp::traits::input_parameter< const uint8_t >::type trunc_bytes(trunc_bytesSEXP);
    Rcpp::traits::input_parameter< const bool >::type force_trunc(force_truncSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_getTAGS(fname, offset, verbose, trunc_bytes, force_trunc));
    return rcpp_result_gen;
END_RCPP
}
// cpp_getoffsets_wid
List cpp_getoffsets_wid(const std::string fname, const R_len_t obj_count, const bool display_progress, const bool verbose);
RcppExport SEXP _IFC_cpp_getoffsets_wid(SEXP fnameSEXP, SEXP obj_countSEXP, SEXP display_progressSEXP, SEXP verboseSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const std::string >::type fname(fnameSEXP);
    Rcpp::traits::input_parameter< const R_len_t >::type obj_count(obj_countSEXP);
    Rcpp::traits::input_parameter< const bool >::type display_progress(display_progressSEXP);
    Rcpp::traits::input_parameter< const bool >::type verbose(verboseSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_getoffsets_wid(fname, obj_count, display_progress, verbose));
    return rcpp_result_gen;
END_RCPP
}
// cpp_checksum
size_t cpp_checksum(const std::string fname);
RcppExport SEXP _IFC_cpp_checksum(SEXP fnameSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const std::string >::type fname(fnameSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_checksum(fname));
    return rcpp_result_gen;
END_RCPP
}
// cpp_rle_Decomp
List cpp_rle_Decomp(const std::string fname, const uint32_t offset, const uint32_t nbytes, const R_len_t imgWidth, const R_len_t imgHeight, const R_len_t nb_channels, const uint8_t removal, const bool verbose);
RcppExport SEXP _IFC_cpp_rle_Decomp(SEXP fnameSEXP, SEXP offsetSEXP, SEXP nbytesSEXP, SEXP imgWidthSEXP, SEXP imgHeightSEXP, SEXP nb_channelsSEXP, SEXP removalSEXP, SEXP verboseSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const std::string >::type fname(fnameSEXP);
    Rcpp::traits::input_parameter< const uint32_t >::type offset(offsetSEXP);
    Rcpp::traits::input_parameter< const uint32_t >::type nbytes(nbytesSEXP);
    Rcpp::traits::input_parameter< const R_len_t >::type imgWidth(imgWidthSEXP);
    Rcpp::traits::input_parameter< const R_len_t >::type imgHeight(imgHeightSEXP);
    Rcpp::traits::input_parameter< const R_len_t >::type nb_channels(nb_channelsSEXP);
    Rcpp::traits::input_parameter< const uint8_t >::type removal(removalSEXP);
    Rcpp::traits::input_parameter< const bool >::type verbose(verboseSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_rle_Decomp(fname, offset, nbytes, imgWidth, imgHeight, nb_channels, removal, verbose));
    return rcpp_result_gen;
END_RCPP
}
// cpp_gray_Decomp1
List cpp_gray_Decomp1(const std::string fname, const uint32_t offset, const uint32_t nbytes, const R_len_t imgWidth, const R_len_t imgHeight, const R_len_t nb_channels, const bool verbose);
RcppExport SEXP _IFC_cpp_gray_Decomp1(SEXP fnameSEXP, SEXP offsetSEXP, SEXP nbytesSEXP, SEXP imgWidthSEXP, SEXP imgHeightSEXP, SEXP nb_channelsSEXP, SEXP verboseSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const std::string >::type fname(fnameSEXP);
    Rcpp::traits::input_parameter< const uint32_t >::type offset(offsetSEXP);
    Rcpp::traits::input_parameter< const uint32_t >::type nbytes(nbytesSEXP);
    Rcpp::traits::input_parameter< const R_len_t >::type imgWidth(imgWidthSEXP);
    Rcpp::traits::input_parameter< const R_len_t >::type imgHeight(imgHeightSEXP);
    Rcpp::traits::input_parameter< const R_len_t >::type nb_channels(nb_channelsSEXP);
    Rcpp::traits::input_parameter< const bool >::type verbose(verboseSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_gray_Decomp1(fname, offset, nbytes, imgWidth, imgHeight, nb_channels, verbose));
    return rcpp_result_gen;
END_RCPP
}
// cpp_decomp
List cpp_decomp(const std::string fname, const uint32_t offset, const uint32_t nbytes, const R_len_t imgWidth, const R_len_t imgHeight, const R_len_t nb_channels, const uint8_t removal, const uint32_t compression, const bool verbose);
RcppExport SEXP _IFC_cpp_decomp(SEXP fnameSEXP, SEXP offsetSEXP, SEXP nbytesSEXP, SEXP imgWidthSEXP, SEXP imgHeightSEXP, SEXP nb_channelsSEXP, SEXP removalSEXP, SEXP compressionSEXP, SEXP verboseSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const std::string >::type fname(fnameSEXP);
    Rcpp::traits::input_parameter< const uint32_t >::type offset(offsetSEXP);
    Rcpp::traits::input_parameter< const uint32_t >::type nbytes(nbytesSEXP);
    Rcpp::traits::input_parameter< const R_len_t >::type imgWidth(imgWidthSEXP);
    Rcpp::traits::input_parameter< const R_len_t >::type imgHeight(imgHeightSEXP);
    Rcpp::traits::input_parameter< const R_len_t >::type nb_channels(nb_channelsSEXP);
    Rcpp::traits::input_parameter< const uint8_t >::type removal(removalSEXP);
    Rcpp::traits::input_parameter< const uint32_t >::type compression(compressionSEXP);
    Rcpp::traits::input_parameter< const bool >::type verbose(verboseSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_decomp(fname, offset, nbytes, imgWidth, imgHeight, nb_channels, removal, compression, verbose));
    return rcpp_result_gen;
END_RCPP
}
// cpp_normalize
NumericMatrix cpp_normalize(const NumericMatrix mat, const NumericVector input_range, const bool full_range, const bool force_range, const double gamma);
RcppExport SEXP _IFC_cpp_normalize(SEXP matSEXP, SEXP input_rangeSEXP, SEXP full_rangeSEXP, SEXP force_rangeSEXP, SEXP gammaSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const NumericMatrix >::type mat(matSEXP);
    Rcpp::traits::input_parameter< const NumericVector >::type input_range(input_rangeSEXP);
    Rcpp::traits::input_parameter< const bool >::type full_range(full_rangeSEXP);
    Rcpp::traits::input_parameter< const bool >::type force_range(force_rangeSEXP);
    Rcpp::traits::input_parameter< const double >::type gamma(gammaSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_normalize(mat, input_range, full_range, force_range, gamma));
    return rcpp_result_gen;
END_RCPP
}
// cpp_cleanse
NumericMatrix cpp_cleanse(const NumericMatrix mat, const IntegerMatrix msk, const bool add_noise, const double bg, const double sd);
RcppExport SEXP _IFC_cpp_cleanse(SEXP matSEXP, SEXP mskSEXP, SEXP add_noiseSEXP, SEXP bgSEXP, SEXP sdSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const NumericMatrix >::type mat(matSEXP);
    Rcpp::traits::input_parameter< const IntegerMatrix >::type msk(mskSEXP);
    Rcpp::traits::input_parameter< const bool >::type add_noise(add_noiseSEXP);
    Rcpp::traits::input_parameter< const double >::type bg(bgSEXP);
    Rcpp::traits::input_parameter< const double >::type sd(sdSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_cleanse(mat, msk, add_noise, bg, sd));
    return rcpp_result_gen;
END_RCPP
}
// cpp_mask
NumericMatrix cpp_mask(const NumericMatrix A, const NumericMatrix B, const NumericMatrix mask);
RcppExport SEXP _IFC_cpp_mask(SEXP ASEXP, SEXP BSEXP, SEXP maskSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const NumericMatrix >::type A(ASEXP);
    Rcpp::traits::input_parameter< const NumericMatrix >::type B(BSEXP);
    Rcpp::traits::input_parameter< const NumericMatrix >::type mask(maskSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_mask(A, B, mask));
    return rcpp_result_gen;
END_RCPP
}
// cpp_mark
NumericMatrix cpp_mark(const NumericMatrix A, const NumericMatrix B, const NumericMatrix mask, const R_len_t xoff, const R_len_t yoff, const bool invert);
RcppExport SEXP _IFC_cpp_mark(SEXP ASEXP, SEXP BSEXP, SEXP maskSEXP, SEXP xoffSEXP, SEXP yoffSEXP, SEXP invertSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const NumericMatrix >::type A(ASEXP);
    Rcpp::traits::input_parameter< const NumericMatrix >::type B(BSEXP);
    Rcpp::traits::input_parameter< const NumericMatrix >::type mask(maskSEXP);
    Rcpp::traits::input_parameter< const R_len_t >::type xoff(xoffSEXP);
    Rcpp::traits::input_parameter< const R_len_t >::type yoff(yoffSEXP);
    Rcpp::traits::input_parameter< const bool >::type invert(invertSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_mark(A, B, mask, xoff, yoff, invert));
    return rcpp_result_gen;
END_RCPP
}
// cpp_resize2
Rcpp::NumericMatrix cpp_resize2(const Rcpp::NumericMatrix mat, const R_len_t new_height, const R_len_t new_width, const bool add_noise, const double bg, const double sd);
RcppExport SEXP _IFC_cpp_resize2(SEXP matSEXP, SEXP new_heightSEXP, SEXP new_widthSEXP, SEXP add_noiseSEXP, SEXP bgSEXP, SEXP sdSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const Rcpp::NumericMatrix >::type mat(matSEXP);
    Rcpp::traits::input_parameter< const R_len_t >::type new_height(new_heightSEXP);
    Rcpp::traits::input_parameter< const R_len_t >::type new_width(new_widthSEXP);
    Rcpp::traits::input_parameter< const bool >::type add_noise(add_noiseSEXP);
    Rcpp::traits::input_parameter< const double >::type bg(bgSEXP);
    Rcpp::traits::input_parameter< const double >::type sd(sdSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_resize2(mat, new_height, new_width, add_noise, bg, sd));
    return rcpp_result_gen;
END_RCPP
}
// cpp_transform
NumericVector cpp_transform(const NumericMatrix mat, const NumericVector color, const IntegerMatrix msk, const IntegerVector size, const std::string mode, const uint16_t type, const NumericVector input_range, const bool add_noise, const double bg, const double sd, const bool full_range, const bool force_range, const double gamma);
RcppExport SEXP _IFC_cpp_transform(SEXP matSEXP, SEXP colorSEXP, SEXP mskSEXP, SEXP sizeSEXP, SEXP modeSEXP, SEXP typeSEXP, SEXP input_rangeSEXP, SEXP add_noiseSEXP, SEXP bgSEXP, SEXP sdSEXP, SEXP full_rangeSEXP, SEXP force_rangeSEXP, SEXP gammaSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const NumericMatrix >::type mat(matSEXP);
    Rcpp::traits::input_parameter< const NumericVector >::type color(colorSEXP);
    Rcpp::traits::input_parameter< const IntegerMatrix >::type msk(mskSEXP);
    Rcpp::traits::input_parameter< const IntegerVector >::type size(sizeSEXP);
    Rcpp::traits::input_parameter< const std::string >::type mode(modeSEXP);
    Rcpp::traits::input_parameter< const uint16_t >::type type(typeSEXP);
    Rcpp::traits::input_parameter< const NumericVector >::type input_range(input_rangeSEXP);
    Rcpp::traits::input_parameter< const bool >::type add_noise(add_noiseSEXP);
    Rcpp::traits::input_parameter< const double >::type bg(bgSEXP);
    Rcpp::traits::input_parameter< const double >::type sd(sdSEXP);
    Rcpp::traits::input_parameter< const bool >::type full_range(full_rangeSEXP);
    Rcpp::traits::input_parameter< const bool >::type force_range(force_rangeSEXP);
    Rcpp::traits::input_parameter< const double >::type gamma(gammaSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_transform(mat, color, msk, size, mode, type, input_range, add_noise, bg, sd, full_range, force_range, gamma));
    return rcpp_result_gen;
END_RCPP
}
// cpp_extract
List cpp_extract(const std::string fname, const List ifd, const List colors, const CharacterVector physicalChannel, const NumericVector xmin, const NumericVector xmax, const IntegerVector removal, const LogicalVector add_noise, const LogicalVector full_range, const LogicalVector force_range, const NumericVector gamma, const IntegerVector chan_to_extract, const uint8_t extract_msk, const std::string mode, const IntegerVector size, const bool verbose);
RcppExport SEXP _IFC_cpp_extract(SEXP fnameSEXP, SEXP ifdSEXP, SEXP colorsSEXP, SEXP physicalChannelSEXP, SEXP xminSEXP, SEXP xmaxSEXP, SEXP removalSEXP, SEXP add_noiseSEXP, SEXP full_rangeSEXP, SEXP force_rangeSEXP, SEXP gammaSEXP, SEXP chan_to_extractSEXP, SEXP extract_mskSEXP, SEXP modeSEXP, SEXP sizeSEXP, SEXP verboseSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const std::string >::type fname(fnameSEXP);
    Rcpp::traits::input_parameter< const List >::type ifd(ifdSEXP);
    Rcpp::traits::input_parameter< const List >::type colors(colorsSEXP);
    Rcpp::traits::input_parameter< const CharacterVector >::type physicalChannel(physicalChannelSEXP);
    Rcpp::traits::input_parameter< const NumericVector >::type xmin(xminSEXP);
    Rcpp::traits::input_parameter< const NumericVector >::type xmax(xmaxSEXP);
    Rcpp::traits::input_parameter< const IntegerVector >::type removal(removalSEXP);
    Rcpp::traits::input_parameter< const LogicalVector >::type add_noise(add_noiseSEXP);
    Rcpp::traits::input_parameter< const LogicalVector >::type full_range(full_rangeSEXP);
    Rcpp::traits::input_parameter< const LogicalVector >::type force_range(force_rangeSEXP);
    Rcpp::traits::input_parameter< const NumericVector >::type gamma(gammaSEXP);
    Rcpp::traits::input_parameter< const IntegerVector >::type chan_to_extract(chan_to_extractSEXP);
    Rcpp::traits::input_parameter< const uint8_t >::type extract_msk(extract_mskSEXP);
    Rcpp::traits::input_parameter< const std::string >::type mode(modeSEXP);
    Rcpp::traits::input_parameter< const IntegerVector >::type size(sizeSEXP);
    Rcpp::traits::input_parameter< const bool >::type verbose(verboseSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_extract(fname, ifd, colors, physicalChannel, xmin, xmax, removal, add_noise, full_range, force_range, gamma, chan_to_extract, extract_msk, mode, size, verbose));
    return rcpp_result_gen;
END_RCPP
}
// cpp_smoothLinLog
NumericVector cpp_smoothLinLog(const NumericVector x, const double hyper, const double base, const double lin_comp);
RcppExport SEXP _IFC_cpp_smoothLinLog(SEXP xSEXP, SEXP hyperSEXP, SEXP baseSEXP, SEXP lin_compSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const NumericVector >::type x(xSEXP);
    Rcpp::traits::input_parameter< const double >::type hyper(hyperSEXP);
    Rcpp::traits::input_parameter< const double >::type base(baseSEXP);
    Rcpp::traits::input_parameter< const double >::type lin_comp(lin_compSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_smoothLinLog(x, hyper, base, lin_comp));
    return rcpp_result_gen;
END_RCPP
}
// cpp_inv_smoothLinLog
NumericVector cpp_inv_smoothLinLog(const NumericVector x, const double hyper, const double base, const double lin_comp);
RcppExport SEXP _IFC_cpp_inv_smoothLinLog(SEXP xSEXP, SEXP hyperSEXP, SEXP baseSEXP, SEXP lin_compSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const NumericVector >::type x(xSEXP);
    Rcpp::traits::input_parameter< const double >::type hyper(hyperSEXP);
    Rcpp::traits::input_parameter< const double >::type base(baseSEXP);
    Rcpp::traits::input_parameter< const double >::type lin_comp(lin_compSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_inv_smoothLinLog(x, hyper, base, lin_comp));
    return rcpp_result_gen;
END_RCPP
}
// cpp_int32_to_uint32
uint32_t cpp_int32_to_uint32(const int32_t x);
RcppExport SEXP _IFC_cpp_int32_to_uint32(SEXP xSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const int32_t >::type x(xSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_int32_to_uint32(x));
    return rcpp_result_gen;
END_RCPP
}
// cpp_uint32_to_int32
int32_t cpp_uint32_to_int32(const uint32_t x);
RcppExport SEXP _IFC_cpp_uint32_to_int32(SEXP xSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const uint32_t >::type x(xSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_uint32_to_int32(x));
    return rcpp_result_gen;
END_RCPP
}
// cpp_computeGamma
double cpp_computeGamma(const NumericVector V);
RcppExport SEXP _IFC_cpp_computeGamma(SEXP VSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const NumericVector >::type V(VSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_computeGamma(V));
    return rcpp_result_gen;
END_RCPP
}
// cpp_base64_encode
std::string cpp_base64_encode(const RawVector x);
RcppExport SEXP _IFC_cpp_base64_encode(SEXP xSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const RawVector >::type x(xSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_base64_encode(x));
    return rcpp_result_gen;
END_RCPP
}
// cpp_writeBMP
RawVector cpp_writeBMP(const NumericVector image);
RcppExport SEXP _IFC_cpp_writeBMP(SEXP imageSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const NumericVector >::type image(imageSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_writeBMP(image));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_IFC_cpp_assert", (DL_FUNC) &_IFC_cpp_assert, 6},
    {"_IFC_cpp_M_HSV2RGB", (DL_FUNC) &_IFC_cpp_M_HSV2RGB, 3},
    {"_IFC_cpp_ell_coord", (DL_FUNC) &_IFC_cpp_ell_coord, 2},
    {"_IFC_cpp_pnt_in_gate", (DL_FUNC) &_IFC_cpp_pnt_in_gate, 4},
    {"_IFC_cpp_scanFirst", (DL_FUNC) &_IFC_cpp_scanFirst, 5},
    {"_IFC_cpp_checkTIFF", (DL_FUNC) &_IFC_cpp_checkTIFF, 1},
    {"_IFC_cpp_getoffsets_noid", (DL_FUNC) &_IFC_cpp_getoffsets_noid, 4},
    {"_IFC_cpp_getTAGS", (DL_FUNC) &_IFC_cpp_getTAGS, 5},
    {"_IFC_cpp_getoffsets_wid", (DL_FUNC) &_IFC_cpp_getoffsets_wid, 4},
    {"_IFC_cpp_checksum", (DL_FUNC) &_IFC_cpp_checksum, 1},
    {"_IFC_cpp_rle_Decomp", (DL_FUNC) &_IFC_cpp_rle_Decomp, 8},
    {"_IFC_cpp_gray_Decomp1", (DL_FUNC) &_IFC_cpp_gray_Decomp1, 7},
    {"_IFC_cpp_decomp", (DL_FUNC) &_IFC_cpp_decomp, 9},
    {"_IFC_cpp_normalize", (DL_FUNC) &_IFC_cpp_normalize, 5},
    {"_IFC_cpp_cleanse", (DL_FUNC) &_IFC_cpp_cleanse, 5},
    {"_IFC_cpp_mask", (DL_FUNC) &_IFC_cpp_mask, 3},
    {"_IFC_cpp_mark", (DL_FUNC) &_IFC_cpp_mark, 6},
    {"_IFC_cpp_resize2", (DL_FUNC) &_IFC_cpp_resize2, 6},
    {"_IFC_cpp_transform", (DL_FUNC) &_IFC_cpp_transform, 13},
    {"_IFC_cpp_extract", (DL_FUNC) &_IFC_cpp_extract, 16},
    {"_IFC_cpp_smoothLinLog", (DL_FUNC) &_IFC_cpp_smoothLinLog, 4},
    {"_IFC_cpp_inv_smoothLinLog", (DL_FUNC) &_IFC_cpp_inv_smoothLinLog, 4},
    {"_IFC_cpp_int32_to_uint32", (DL_FUNC) &_IFC_cpp_int32_to_uint32, 1},
    {"_IFC_cpp_uint32_to_int32", (DL_FUNC) &_IFC_cpp_uint32_to_int32, 1},
    {"_IFC_cpp_computeGamma", (DL_FUNC) &_IFC_cpp_computeGamma, 1},
    {"_IFC_cpp_base64_encode", (DL_FUNC) &_IFC_cpp_base64_encode, 1},
    {"_IFC_cpp_writeBMP", (DL_FUNC) &_IFC_cpp_writeBMP, 1},
    {NULL, NULL, 0}
};

RcppExport void R_init_IFC(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
