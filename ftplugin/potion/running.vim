if !exists("g:potion_command")
    let g:potion_command = "potion"
endif

function! PotionCompileAndRunFile()
    silent !clear
    execute "!docker run -it -v %:p:h:/scripts potion /scripts/%:t"
endfunction

nnoremap <buffer> <leader>gc :call PotionCompileAndRunFile()<cr>

function! PotionShowBytecode()
    " Get the bytecode.
    let script_dir = fnamemodify(bufname('%'), ':p:h')
    let script_name = fnamemodify(bufname('%'), ':t')
    let bytecode = system("docker run -v " . script_dir . ":/scripts potion -c -V /scripts/" . script_name)

    " Open a new split and set it up.
    let bytecodeWin = bufwinnr("__Potion_Bytecode__")
    if bytecodeWin == -1
        vsplit __Potion_Bytecode__
        let bytecodeWin = bufwinnr("__Potion_Bytecode__")
    else
        execute bytecodeWin . "wincmd w"
        normal! ggdG
    endif
    setlocal filetype=potionbytecode
    setlocal buftype=nofile

    " Insert the bytecode.
    call append(0, split(bytecode, '\v\n'))
endfunction


nnoremap <buffer> <leader>gt :call PotionShowBytecode()<cr>
