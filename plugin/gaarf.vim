if exists("g:gaarf_command")
	let gaarf_cmd=g:gaarf_command
	let gaarfbq_cmd=g:gaarf_command . "-bq"
	let gaarf_sql=g:gaarf_command . "-sql"
	let gaarfsim_cmd=g:gaarf_command . "-simulator"
else
	let gaarf_cmd="gaarf"
	let gaarfbq_cmd="gaarf-bq"
	let gaarfsql_cmd="gaarf-sql"
	let gaarfsim_cmd="gaarf-simulator"
endif

if !exists("g:gaarf_api_version")
		let gaarf_api_version="13"
endif

if !exists("g:gaarf_logger")
		let gaarf_logger="rich"
endif

if !exists("g:gaarf_output")
		let gaarf_output="console"
endif

if !exists("g:gaarf_ads_config")
	let gaarf_ads_config="$HOME/google-ads.yaml"
endif

function! CallGaarf()
	if !exists("g:gaarf_config")
		echoerr "Please specify g:gaarf_config variable!"
	endif
	silent !clear
	echo "Running gaarf command"
	execute "!" . g:gaarf_cmd . " " . bufname("%") . " -c=" . g:gaarf_config . " --loglevel=" . g:gaarf_logging . " --api-version=" . g:gaarf_api_version . " --logger=" . g:gaarf_logger . " --ads-config=" . gaarf_ads_config

endfunction

function! CallGaarfCustom()
	if !exists("g:gaarf_macro")
		echoerr "Please specify g:gaarf_macro variable!"
	endif
	silent !clear
	echo "Running gaarf command"
	execute "!" . g:gaarf_cmd . " " . bufname("%") . " --account=" . g:gaarf_account . " --output=" . g:gaarf_output . " " .  g:gaarf_macro . " --loglevel=" . g:gaarf_logging . " --api-version=" . g:gaarf_api_version . " --logger=" . g:gaarf_logger . " --ads-config=" . g:gaarf_ads_config
endfunction

function! CallGaarfDefault()
	silent !clear
	echomsg "Running gaarf command"
	execute "!" . g:gaarf_cmd . " " . bufname("%") . " --account=" . g:gaarf_account . " --output=console --macro.start_date=:YYYYMMDD-30 --macro.end_date=:YYYYMMDD-1 --loglevel=" . g:gaarf_logging . " --api-version=" . g:gaarf_api_version . " --logger=rich"  . " --ads-config=" . g:gaarf_ads_config
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
	if !exists("g:gaarfbq_macro")
		echoerr "Please specify g:gaarfbq_macro variable!"
	endif
	silent !clear
	echomsg "Running gaarf-bq command"
	execute "!" . g:gaarfbq_cmd . " " . bufname("%") . " --project=" . g:gaarfbq_project . " " . g:gaarfbq_macro . " --loglevel=" . g:gaarf_logging
endfunction

function! CallGaarfSql()
	if !exists("g:gaarf_config")
		echoerr "Please specify g:gaarf_config variable!"
	endif
	silent !clear
	echomsg "Running gaarf-sql command"
	execute "!" . g:gaarfsql_cmd . " " . bufname("%") . " -c=" . g:gaarf_config . " --loglevel=" . g:gaarf_logging
endfunction

function! CallGaarfSqlCustom()
	if !exists("g:gaarfsql_macro")
		echoerr "Please specify g:gaarfsql_macro variable!"
	endif
	silent !clear
	echomsg "Running gaarf-sql command"
	execute "!" . g:gaarfsql_cmd . " " . bufname("%") . " --conn=" . g:gaarf_connection_string . " " . g:gaarfsql_macro . " --loglevel=" . g:gaarf_logging
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
command! GaarfSql call CallGaarfSql()
command! GaarfSqlCustom call CallGaarfSqlCustom()
command! GaarfCustom call CallGaarfCustom()
command! GaarfSimulator call CallGaarfSimulator()

nnoremap <silent> <localleader>gg :Gaarf<CR>
nnoremap <silent> <localleader>gf :GaarfDefault<CR>
nnoremap <silent> <localleader>gb :GaarfBq<CR>
nnoremap <silent> <localleader>gq :GaarfSql<CR>
nnoremap <silent> <localleader>gs :GaarfSimulator<CR>
