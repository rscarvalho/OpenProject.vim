*OpenProject.txt*   Open and manages projects in vim
*OpenProject*


                              OpenProject ~
                            Reference Manual ~

==============================================================================
CONTENTS                                                OpenProject-contents

    1. Intro.....................................|OpenProject-intro|
    2. Usage.....................................|OpenProject-Usage|
    2. Variables.................................|OpenProject-variables|
        2.1. g:OpenProject#folder_prefix.........|g:OpenProject#folder_prefix|
        2.2. g:OpenProject#projects..............|g:OpenProject#projects|
    3. Autocommands..............................|OpenProject-autocommands|
    4. License...................................|OpenProject-license|


==============================================================================
1. Intro                                                   *OpenProject-intro*

OpenProject is a utility to open folders as "projects"

==============================================================================
2. Usage

OpenProject creates a command with the same name, where you can open
predefined projects or even arbitrary folders.

Examples:

To open a project called "myproject" configured in |g:OpenProject#projects|: >
    :OpenProject myproject
<
To open a subfolder of your |g:OpenProject#folder_prefix|: >
    :OpenProject myfolder/subfolder
<
To open an arbitraty path: >
    :OpenProject ~/Documents/something
<
By default it just "cd" to that directory. Its power comes with the ease to
access projects by name by configuring |g:OpenProject#projects| and hooking
|autocommand|s to be executed upon project open.

==============================================================================
3. Variables                                            *OpenProject-variables*

This section defines the variables used to customize OpenProject behavior.

------------------------------------------------------------------------------
3.1 g:OpenProject#folder_prefix                  *g:OpenProject#folder_prefix*

Specify a folder prefix for all projects defined in |g:OpenProject#projects|.
Defaults to: >
    let g:OpenProject#folder_prefix = $HOME . "/code/"

Example: >
    let g:OpenProject#folder_prefix = $HOME . "/Projects/"
<

------------------------------------------------------------------------------
3.2 g:OpenProject#projects                            *g:OpenProject#projects*
Specify a dictionary of all your projects. This stands for quick access to
folders without the need to specify the full folder path. Defaults to: >
    let g:OpenProject#projects = {}
<

Example: >
    let g:OpenProject#projects = {"myproject": "ruby/myproject",
                                 \"hello_world": "django/my_hello"
                                 \}
<
The dictionary keys are the project "names". The values are relative paths to
|g:OpenProject#folder_prefix|

==============================================================================
4. Autocommands                                    *OpenProject-autocommands*

You can hook up an |autocommand| event to execute something when you open your
project. The |autocommand| follows this naming convention: >
    OpenProject_<project_name>
<
So if you have a "myproject" project configured in |g:OpenProject#projects|
and you want to open the "Gemfile" file when you open that project, you can
simply do: >
    autocommand User OpenProject_myproject nested :e Gemfile

==============================================================================
5. License                                             *OpenProject-license*

The MIT License (MIT)

Copyright (c) 2014 Rodolfo Carvalho <rodolfo@infweb.net>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

 vim:tw=78:sw=4:ft=help:norl:
