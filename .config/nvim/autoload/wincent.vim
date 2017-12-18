if(!exists('g:WincentFocusBlacklist'))
    let g:WincentFocusBlacklist = ['diff', 'undotree', 'nerdtree', 'qf', 'nvimbols', 'denite']
endif

function! wincent#focus_enabled()
    return index(g:WincentFocusBlacklist, &filetype) == -1
endfunction

function! wincent#blur_window() abort
    if wincent#focus_enabled()
        if !exists('w:wincent_matches')
            " Instead of unconditionally resetting, append to existing array.
            " This allows us to gracefully handle duplicate autocmds.
            let w:wincent_matches=[]
        endif
        let l:height=&lines
        let l:slop=l:height / 2
        let l:start=max([1, line('w0') - l:slop])
        let l:end=min([line('$'), line('w$') + l:slop])
        while l:start <= l:end
            let l:next=l:start + 8
            let l:id=matchaddpos(
                        \   'SignColumn',
                        \   range(l:start, min([l:end, l:next])),
                        \   1000
                        \ )
            call add(w:wincent_matches, l:id)
            let l:start=l:next
        endwhile
    endif
endfunction

function! wincent#focus_window() abort
    if wincent#focus_enabled()
        if exists('w:wincent_matches')
            for l:match in w:wincent_matches
                try
                    call matchdelete(l:match)
                catch /.*/
                    " In testing, not getting any error here, but being ultra-cautious.
                endtry
            endfor
            let w:wincent_matches=[]
        endif
    endif
endfunction
