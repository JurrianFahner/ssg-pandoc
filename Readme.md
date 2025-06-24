# a static site generator with pandoc

This repo describes a simple way to use pandoc to generate documentation as `html` or a printable `pdf`. 
The documentation needs to be readable even when there is no connection to the internet, this is why no files are pulled from a CDN.

## description of the folders

| folder                      | description                                                              |
|:----------------------------|:-------------------------------------------------------------------------|
| [config][config-folder]     | Configuration that can be used to control the output.                    |
| [content][content-folder]   | This directory contains the example content, this can be fully replaced. |
| [template][template-folder] | This directory holds the templates for pdf and html rendering.           |


## TODO

- [x] - add css framework
- [x] - describe installation
- [ ] - make scripts for generating pdfs

## installing on windows

For windows you'll need to install pandoc, this software can be found at https://pandoc.org/installing.html#windows.

If you want to be able to generate pdfs, please also install the following latex engine: https://miktex.org/download

## installing on debian / ubuntu

Run the following command:

```shell
sudo apt install pandoc texlive texlive-latex-extra
```






<!-- Folders that are used in this project  -->
[config-folder]: ./config/
[content-folder]: ./content/
[template-folder]: ./template/

