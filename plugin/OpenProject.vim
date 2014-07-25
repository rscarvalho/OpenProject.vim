function! OpenProject(project_name)
  if exists("g:OpenProject#projects")
    let projects = g:OpenProject#projects
  else
    let projects = {}
  endif

  if exists("g:OpenProject#folder_prefix")
    let project_folder_prefix = g:OpenProject#folder_prefix
  else
    let project_folder_prefix = $HOME . "/code/"
  endif
  if has_key(l:projects, a:project_name)
    let project_folder = l:project_folder_prefix . l:projects[a:project_name]
  elseif strlen(glob(l:project_folder_prefix . a:project_name)) > 0
    let project_folder = l:project_folder_prefix . a:project_name
  elseif strlen(glob(a:project_name)) > 0
    let project_folder = a:project_name
  endif

  if exists("l:project_folder")
    exec ":cd " . l:project_folder
    exec ":doautocmd User OpenProject_" . a:project_name
  else
    exec "normal \<Esc>"
    echoerr "Invalid project name or folder: " . a:project_name
  end
endfunction

function! OpenProjectComplete(ArgLead, CmdLine, CursorPos)
  let valid_keys = []
  for project in keys(g:OpenProject#projects)
    if l:project =~ a:ArgLead
      call add(l:valid_keys, l:project)
    endif
  endfor
  return l:valid_keys
endfunction

command! -nargs=1 -complete=customlist,OpenProjectComplete OpenProject call OpenProject(<f-args>)
