#' Convert Color
#'
#' @param color The color to convert. Can be either a hexadecimal code, or a numeric rgb 
#' vector listing three intensities between `0` and `1`.
#'
#' @return Color vector
#' @keywords internal
convert_color = function(color, as_hex = FALSE) {
  if(inherits(color,"character")) {
    color = as.vector(grDevices::col2rgb(color))/255
  } 
  if(as_hex) {
    paste0("#",paste0(format(as.hexmode(round(color*255,0)),width=2),collapse=""),collapse="")
  } else {
    color
  }
}

#' Rescale
#'
#' @param vals Values
#' @param to to vales
#'
#' @return Color vector
#' @keywords internal
rescale = function(vals, to=c(0,1)) {
  range_vals = range(vals[!is.infinite(vals)],na.rm=TRUE)
  vals = (vals-range_vals[1])/(range_vals[2]-range_vals[1])
  (vals + to[1]) * (t[2]-t[1])
}

#' Check Filename
#'
#' @param file Filename to be checked
#' @return Flipped matrix
#' @keywords internal
get_file_type = function(file) {
  if(is.character(file)) {
    if(tools::file_ext(file) == "png") {
      imagetype = "png"
    } else {
      imagetype = "jpg"
    }
  } else if (length(dim(file)) == 3) {
    imagetype = "array"
  } else if (length(dim(file)) == 2) {
    imagetype = "matrix"
  } else {
    stop("`",file,"` not recognized class (png, jpeg, array, matrix).")
  }
  
}

#' Flip Left-Right
#'
#' @param x Matrix
#'
#' @return Flipped matrix
#' @keywords internal
fliplr = function(x) {
  if(length(dim(x)) == 2) {
    x[,ncol(x):1]
  } else {
    x[,ncol(x):1,]
  }
}


#' Flip Up-Down
#'
#' @param x Matrix
#'
#' @return Flipped matrix
#' @keywords internal
flipud = function(x) {
  if(length(dim(x)) == 2) {
    x[nrow(x):1,]
  } else {
    x[nrow(x):1,,]
  }
}
