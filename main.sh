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
			
			# for opening pdf in preferred pdf viewer
			-o|--open)
			xdg-open ${1}.pdf
			shift
			;;
	
			# removes random files after buildup
			-c|--clean)
			rm ${1}.log
			rm ${1}.aux
			rm ${1}.out
			rm ${1}.blg
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
			less ~/build_latex/manual.txt
			shift


			# ----------------------------------------------------------------------
			# populating files with template
			# article template
			-p_article|--populate_article)
			touch ${1}.tex
			~/build_latex/template/article.tex > ${1}.tex
			shift
			;;

			# beamer template
			-p_beamer|--populate_beamer)
			touch ${1}.tex
			~/build_latex/template/beamer.tex > ${1}.tex
			shift
			;;

			# letter template
			-p_letter|--populate_letter)
			touch ${1}.tex
			~/build_latex/template/letter.tex > ${1}.tex
			shift
			;;

			# cv template
			-p_cv|--populate_cv)
			touch ${1}.tex
			~/build_latex/template/cv.tex > ${1}.tex
			shift
			;;

			# report template
			-p_report|--populate_report)
			touch ${1}.tex
			~/build_latex/template/report.tex > ${1}.tex
			shift
			;;
			# ----------------------------------------------------------------------
		esac
	done
}

