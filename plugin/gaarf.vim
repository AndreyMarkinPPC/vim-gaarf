if exists("g:gaarf_command")
	let gaarf_cmd=g:gaarf_command
	let gaarfbq_cmd=g:gaarf_command . "-bq"
	let gaarfsim_cmd=g:gaarf_command . "-simulator"
else
	let gaarf_cmd="gaarf"
	let gaarfbq_cmd="gaarf-bq"
	let gaarfsim_cmd="gaarf-simulator"
endif

function! CallGaarf()
	if !exists("g:gaarf_config")
		echoerr "Please specify g:gaarf_config variable!"
	endif
	silent !clear
	echo "Running gaarf command"
	execute "!" . g:gaarf_cmd . " " . bufname("%") . " -c=" . g:gaarf_config . " --loglevel=" . g:gaarf_logging
endfunction

function! CallGaarfCustom()
	if !exists("g:gaarf_macro")
		echoerr "Please specify g:gaarf_macro variable!"
	endif
	silent !clear
	echo "Running gaarf command"
	execute "!" . g:gaarf_cmd . " " . bufname("%") . " -c=" . " " . g:gaarf_macro . " --loglevel=" . g:gaarf_logging
endfunction

function! CallGaarfDefault()
	silent !clear
	echomsg "Running gaarf command"
	execute "!" . g:gaarf_cmd . " " . bufname("%") . " --account=" . g:gaarf_account . " --output=console --macro.start_date=:YYYYMMDD-30 --macro.end_date=:YYYYMMDD-1" . " --loglevel=" . g:gaarf_logging
endfunction

function! CallGaarfBq()
	if !exists("g:gaarf_config")
		echoerr "Please specify g:gaarf_config variable!"
	endif
	silent !clear
	echomsg "Running gaarf-bq command"
	execute "!" . g:gaarfbq_cmd . " " . bufname("%") . " -c=" . g:gaarf_config . " --loglevel=" . g:gaarf_logging
endfunction

function! CallGaarfBqCustom()
	silent !clear
	echomsg "Running gaarf-bq command"
	execute "!" . g:gaarfbq_cmd . " " . bufname("%") . " --project=" . g:gaarfbq_project . " " . g:gaarfbq_macro . " --loglevel=" . g:gaarf_logging
endfunction

function! CallGaarfSimulator()
	silent !clear
	echo "Running gaarf-simulator command"
	execute "!" . g:gaarfsim_cmd . " " . bufname("%")
endfunction

command! Gaarf call CallGaarf()
command! GaarfDefault call CallGaarfDefault()
command! GaarfBq call CallGaarfBq()
command! GaarfBqCustom call CallGaarfBqCustom()
command! GaarfCustom call CallGaarfCustom()
command! GaarfSimulator call CallGaarfSimulator()

nmap <silent> <leader>gg :Gaarf<CR>
nmap <silent> <leader>gf :GaarfDefault<CR>
nmap <silent> <leader>gb :GaarfBq<CR>
nmap <silent> <leader>gs :GaarfSimulator<CR>
