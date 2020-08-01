function build_latex()
{
	for arg in "$@"
	do
		case $arg in
			# for building latex without bibliography
			-bs|--build_small)
			pdflatex ${1}.tex
			shift
			;;

			# for building latex with bibliography
			-bl|--build_large)
			pdflatex ${1}.tex
			bibtex ${1}.aux
			pdflatex ${1}.tex
			pdflatex ${1}.tex
			shift
			;;
			
			# for opening in google chrome
			-o|--open)
			chrome ${1}.pdf
			shift
			;;
	
			# for finding which package to install for missing .sty file
			-f|--find)
			sudo apt-file find ${2}
			shift
			;;

			# installs the .sty package container
			-i|--install)
			sudo apt-get install ${2}
			shift
			;;

			# for printing manual
			-h|--help) 
			less manual.txt
			shift
		esac
	done
}

