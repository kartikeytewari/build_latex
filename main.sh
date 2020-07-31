function build_latex()
{
	for arg in "$@"
	do
		case $arg in
			# for building latex without bibliography
			-bs|--build_small)
			pdflatex ${1}.tex
			;;
			# for building latex with bibliography
			-bl|--build_large)
			pdflatex ${1}.tex
			bibtex ${1}.aux
			pdflatex ${1}.tex
			pdflatex ${1}.tex
			;;
			 # for opening in google chrome
			-o|--open)
			chrome ${1}.pdf
			shift
			;;
			# for printing manual
			-h|--help) 
			echo "build_latex function is used for building latex files"
			echo "along with bibliography (if used)"
			echo "flags:"
			echo ""
			echo "-bs | --build_small"
			echo "		just builds the latex file"
			echo ""
			echo "-bl | --build_large"
			echo "		builds the latex file along with bibliography"
			echo "		if .bib file is not found then it is ignored"
			echo ""
			echo "-o | --open"
			echo "		This opens the built pdf in chrome"
			echo ""
			echo "-h | --help"
			echo "		Prints this manual page"
			echo ""
			echo "Under development. MIT LIcense 2020"
			echo "For more information see www.kartikeytewari.github.io/blog/build_latex"
			echo "for feedback/suggestions contact developer at: kartikeya30@gmail.com"
		esac
	done
}

