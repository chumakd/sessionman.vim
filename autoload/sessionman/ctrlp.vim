
if exists('g:loaded_ctrlp_session') && g:loaded_ctrlp_session
    finish
end

let g:loaded_ctrlp_session = 1


call add(g:ctrlp_ext_vars, {
    \ 'init': 'sessionman#ctrlp#init()',
    \ 'accept': 'sessionman#ctrlp#accept',
    \ 'lname': 'session',
    \ 'sname': 'ses',
    \ })

function! sessionman#ctrlp#init()
    return split(GetSessionListString())
endfunction

function! sessionman#ctrlp#accept(mode, str)
    call ctrlp#exit()
    let cmd = ":SessionOpen ".a:str
    execute cmd
endfunction

" Give the extension an ID
let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
" Allow it to be called later
function! sessionman#ctrlp#id()
  return s:id
endfunction
