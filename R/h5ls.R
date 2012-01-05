
h5lsConvertToDataframe <- function(L, all=FALSE) {
  if (is.data.frame(L)) {
    L$ltype <- h5const2Factor("H5L_TYPE", L$ltype)
    L$otype <- h5const2Factor("H5O_TYPE", L$otype)
    L$atime <- .POSIXct(L$atime)
    L$atime[L$atime == 0] <- NA
    L$mtime <- .POSIXct(L$mtime)
    L$mtime[L$mtime == 0] <- NA
    L$ctime <- .POSIXct(L$ctime)
    L$ctime[L$ctime == 0] <- NA
    L$btime <- .POSIXct(L$btime)
    L$btime[L$btime == 0] <- NA
    ## L <- as.data.frame(L, stringsAsFactors=FALSE)
    if (!all) {
      L <- L[,c("group", "name", "otype", "dclass", "ctime","dim")]
    }
  } else {
    for (i in seq_len(length(L))) {
      L[i] <- list(h5lsConvertToDataframe(L[[i]],all=all))
    }
  }
  L
}

h5ls <- function( file, recursive = TRUE, all=FALSE, objecttype = h5default("H5O_TYPE"), datasetinfo=TRUE, index_type = h5default("H5_INDEX"), order = h5default("H5_ITER")) {
  if (is( file, "H5file" ) | is( file, "H5group" )) {
    h5loc = file
  } else {
    if (is.character(file)) {
      if (file.exists(file)) {
        h5loc <- H5Fopen(file)
      } else {
        message("Can not open file '",file,"'.")
        return(NULL)
      }
    } else {
      stop("file has to be either a valid file or an object of class H5file or H5group.")
    }
  }

  if (length(datasetinfo)!=1 || !is.logical(datasetinfo)) stop("'datasetinfo' must be a logical of length 1")
  objecttype <- h5checkConstants( "H5O_TYPE", objecttype )
  index_type <- h5checkConstants( "H5_INDEX", index_type )
  order <- h5checkConstants( "H5_ITER", order )
  if (is.logical(recursive)) {
    if (recursive) {
      depth = -1L
    } else {
      depth = 1L
    }
  } else {
    if (is.numeric(recursive)) {
      depth = as.integer(recursive)
      if (recursive == 0) {
        stop("value 0 for 'recursive' is undefined, either a positive integer or negative (maximum recursion)")
      }
    } else {
      stop("'recursive' must be an integer of length 1 or a logical")
    }
  }
  di <- ifelse(datasetinfo, 1L, 0L)
  L <- .Call("_h5ls", h5loc@ID, depth, objecttype, di, index_type, order, PACKAGE='rhdf5')
  L <- h5lsConvertToDataframe(L, all=all)
  if (!is( file, "H5file" ) & !is( file, "H5group" )) {
    H5Fclose(h5loc)
  }
  L
}

