function! CallGaarf()
	if !exists("g:gaarf_config")
		echoerr "Please specify g:gaarf_config variable!"
	endif
	silent !clear
	echo "Running gaarf command"
	execute "!" . g:gaarf_command . " " . bufname("%") . " -c=" . g:gaarf_config . " --loglevel=" . g:gaarf_logging
endfunction

function! CallGaarfCustom()
	if !exists("g:gaarf_macro")
		echoerr "Please specify g:gaarf_macro variable!"
	endif
	silent !clear
	echo "Running gaarf command"
	execute "!" . g:gaarf_command . " " . bufname("%") . " -c=" . " " . g:gaarf_macro . " --loglevel=" . g:gaarf_logging

endfunction

function! CallGaarfDefault()
	silent !clear
	echomsg "Running gaarf command"
	execute "!" . g:gaarf_command . " " . bufname("%") . " --account=" . g:gaarf_account . " --output=console --macro.start_date=:YYYYMMDD-30 --macro.end_date=:YYYYMMDD-1" . " --loglevel=" . g:gaarf_logging

endfunction

function! CallGaarfBq()
	if !exists("g:gaarf_config")
		echoerr "Please specify g:gaarf_config variable!"
	endif
	silent !clear
	echomsg "Running gaarf-bq command"
	execute "!" . g:gaarfbq_command . " " . bufname("%") . " -c=" . g:gaarf_config . " --loglevel=" . g:gaarf_logging

endfunction

function! CallGaarfBqCustom()
	silent !clear
	echomsg "Running gaarf-bq command"
	execute "!" . g:gaarfbq_command . " " . bufname("%") . " --project=" . g:gaarfbq_project . " " . g:gaarfbq_macro . " --loglevel=" . g:gaarf_logging

endfunction

command! Gaarf call CallGaarf()
command! GaarfDefault call CallGaarfDefault()
command! GaarfBq call CallGaarfBq()
command! GaarfBqCustom call CallGaarfBqCustom()
command! GaarfCustom call CallGaarfCustom()

nmap <silent> <leader>gg :Gaarf<CR>
nmap <silent> <leader>gb :GaarfBq<CR>
