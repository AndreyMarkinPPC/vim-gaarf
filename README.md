# Vim-gaarf

A Vim wrapper for running [gaarf](https://github.com/google/ads-api-reports-fetcher).

## Setup

1. Clone plugin into your `$HOME/.vim/pack/bundle/start/` folder or install it via Vundle:
```
Plugin 'AndreyMarkinPPC/vim-gaarf'
```

2. (Optional) Add your preferred defaults to `.vimrc`:

```
let g:gaarf_command="/path/to/gaarf"
let g:gaarfbq_project="<BQ PROJECT>"
let g:gaarf_account="<ACCOUNT_ID>"
let g:gaarf_logging="INFO"
```

3. Customizations:

```
" better logging
let g:gaarf_logger="rich"

" custom google-ads.yaml location
let g:gaarf_ads_config="/path/to/google-ads.yaml

" custom output
let g:gaarf_output="sqldb"

" custom macro
let g:gaarf_macro="--macro.start_date=:YYYYMMDD-30"

" custom API version
let g:gaarf_api_version="14"
```

## Commands

| Command          | Description                                                                                                                                                                                                                                                                            |
| :--------------  | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  |
| `:Gaarf`   | Runs `gaarf` command over the provided gaarf_config (specify as `g:gaarf_config` variable (`let g:gaarf_config=$HOME/path/to/gaarf_config.yaml`).                                                                        |
| `:GaarfDefault`     |  Runs `gaarf` over the default values provided in your `.vimrc` (takes `g:gaarf_account` from there), specifies two macros (`start_date` and `end_date` to form the *last 30 days*) and sets up output to `console`                                                                                                                                                           |.
| `:GaarfCustom`      | Runs `gaarf` with a custom configuration. You can overwrite `g:gaarf_account` `g:gaarf_macro`.                                                                                                                                                                                                 |
| `:GaarfBq`     | Runs `gaarf-bq` command over the provided gaarf_config (specify as `g:gaarf_config` variable (`let g:gaarf_config=$HOME/path/to/gaarf_config.yaml`).                                                                                                                      |
| `:GaarfBqCustom`      | Runs `gaarf-bq` with a custom configuration. You can overwrite `g:gaarfbq_project` `g:gaarfbq_macro`.                                                                                                                                                                                                                                                                    |
| `:GaarfSql`     | Runs `gaarf-sql` command over the provided gaarf_config (specify as `g:gaarf_config` variable (`let g:gaarf_config=$HOME/path/to/gaarf_config.yaml`).                                                                                                                      |
| `:GaarfSqlCustom`      | Runs `gaarf-sql` with a custom configuration. You can overwrite `g:gaarfsql_connection_string` `g:gaarfsql_macro`.                                                                                                                                                                                                                                                                    |
| `:GaarfSimulator`      | Runs `gaarf-simulator` command to create simulated data without actually calling Ads API.                                                                                                                                                                                                                                                                    |

## Mappings

Plugin has several default mappings

```
nnoremap <silent> <localleader>gg :Gaarf<CR>
nnoremap <silent> <localleader>gf :GaarfDefault<CR>
nnoremap <silent> <localleader>gb :GaarfBq<CR>
nnoremap <silent> <localleader>gq :GaarfSql<CR>
nnoremap <silent> <localleader>gb :GaarfSimulator<CR>
```
