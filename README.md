# rhdf5

This R/Bioconductor package provides an interface between HDF5 and R. 

This branch is experimental, exploring how to use a version of HDF5 installed via a mechanism other than Rhdf5lib.  This should be considered unsupported and experimental!

It can be installed via something similar to the following command:

```diff 
BiocInstaller::biocLite('grimbough/rhdf5', 
        ref = "system_lib", 
-       configure.args = c(
-            "PKG_LIBS='/usr/lib/x86_64-linux-gnu/hdf5/serial/libhdf5_cpp.so /usr/lib/x86_64-linux-gnu/hdf5/serial/libhdf5.so'",
+            "PKG_CFLAGS=-I/usr/include/hdf5/serial/",
+            "PKG_CXXFLAGS=-I/usr/include/hdf5/serial/")
        )
```    

You should modify the paths on the red highlighted lines to reflect the locations of `libhdf5_cpp.so` and `libhdf5.so` on you system, and the green lines to indicate the location of the HDF5 header files e.g. *hdf5.h*.  Assuming the installation works correctly, you can verify the version of HDF5 **rhdf5** is linked against using `rhdf5::h5version()` e.g.

```r
> rhdf5::h5version()
This is Bioconductor rhdf5 2.25.5.1 linking to C-library HDF5 1.8.16
```

This is not the same as provided via Rhdf5lib:

```r
> Rhdf5lib::getHdf5Version()
[1] "1.8.19"
```

## Contact

For bug reports, please register an [issue](https://github.com/grimbough/rhdf5/issues) here on Github. 


## Funding 

Funding for continued development and maintenance of this package is provided by the German Network for Bioinformatics Infrastructure

<a href="http://www.denbi.de"><img src="https://tess.elixir-europe.org/system/content_providers/images/000/000/063/original/deNBI_Logo_rgb.jpg" width="400" align="left"></a>
