let s:default_command = "! RAILS_ENV=test bundle exec mutant -r ./config/environment --use rspec "

function! s:CurrentClassName()
  let s:current_file = substitute(@%, '\([.*\/]*.*\/\|\.rb\)', '', 'g')
  let s:class_name = substitute(s:current_file, '\(_\|^\)\(.\)', '\u\2', 'g')
  let s:modified_name = substitute(s:class_name, '\(Spec\)', '', 'g')
  return s:modified_name
endfunction

function! s:GetNearestMethodName()
  call search('describe', 'b')
  call search('\#')
  normal l
  return expand("<cword>")
endfunction

function! RunMutationTest()
  let s:class_name = s:CurrentClassName()
  execute s:default_command . s:class_name
endfunction

function! RunNearestMutationTest()
  let l:save_cursor = getpos(".")
  let s:class_name = s:CurrentClassName()
  let s:method_name = s:GetNearestMethodName()
  execute s:default_command . s:class_name . '\#' . s:method_name
  call setpos(".", l:save_cursor)
endfunction

