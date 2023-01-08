# Vim-gaarf

A Vim wrapper for running [gaarf](https://github.com/google/ads-api-reports-fetcher).

## Setup

1. Clone plugin into your `$HOME/.vim/pack/bundle/start/` folder.
2. Add your preferred defaults to `.vimrc`:

```
let g:gaarf_command="/path/to/gaarf"
let g:gaarfbq_command="/path/to/gaarf-bq"
let g:gaarfbq_project="<BQ PROJECT>"
let g:gaarf_account="<ACCOUNT_ID>"
let g:gaarf_logging="INFO"
```

## Commands

| Command          | Description                                                                                                                                                                                                                                                                            |
| :--------------  | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  |
| `:Gaarf`   | Runs `gaarf` command over the provided gaarf_config (specify as `g:gaarf_config` variable (`let g:gaarf_config=$HOME/path/to/gaarf_config.yaml`).                                                                        |
| `:GaarfDefault`     |  Runs `gaarf` over the default values provided in your `.vimrc` (takes `g:gaarf_account` from there), specifies two macros (`start_date` and `end_date` to form the *last 30 days*) and sets up output to `console`                                                                                                                                                           |.
| `:GaarCustom`      | Runs `gaarf` with a custom configuration. You can overwrite `g:gaarf_account` `g:gaarf_macro`.                                                                                                                                                                                                 |
| `:GaarfBq`     | Runs `gaarf-bq` command over the provided gaarf_config (specify as `g:gaarf_config` variable (`let g:gaarf_config=$HOME/path/to/gaarf_config.yaml`).                                                                                                                      |
| `:GaarfBqCustom`      | Runs `gaarf-bq` with a custom configuration. You can overwrite `g:gaarfbq_project` `g:gaarfbq_macro`.                                                                                                                                                                                                                                                                    |

## Mappings

Plugin has two default mappings

```
nmap <silent> <leader>gg :Gaarf<CR>
nmap <silent> <leader>gb :GaarfBq<CR>
```
