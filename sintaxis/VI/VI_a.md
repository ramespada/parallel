===================
=     V I M       =
===================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ENTRAR/SALIR DE VIM
	Entrar a VIM:  		vim archivo.txt <ENTER>
	Salir de VIM:  		:q! <ENTER> 	(en modo Normal)

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
MODOS:
	- Modo normal   	(modo default), se ingresa apretando <ESC>
	- Modo edición		se ingresa aprendando alguno de las siguientes teclas: i/I/a/A/r/R/o/O
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
MOVER EL CURSOR: (en modo normal)
	     ^
	     k		    
       < h	 l >	
	     j		
	     v
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERCIÓN:
	i		Ingresa a modo EDICION desde la posicion del cursor. (insert)
	I		Ingresa a modo EDICION desde el principio de linea.
	a		Ingresa a modo EDICION desde la posicion siguiente al cursor. (append)
	A		Ingresa a modo EDICION desde el final de la linea.
	o		Ingresa a modo EDICION desde inicio de fila anterior.
	O		Ingresa a modo EDICION desde inicio de fila posterior.		

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
DELECIÓN:
	En modo edición:
		<supr> 
		<del>

	En modo normal:
		x			Borra caracter actual.
		X			Borra caracter anterior.
		d <dirección>		Borra caracter.
		D			Borra hasta el final de la linea. Igual que d$
		dd			Borra linea.
		dw			Borra hasta final de palabra.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
UNDO:
		u			UNDO
		<ctrl>r			REDO
		U			UNDO en toda la linea
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GUARDAR:

	Guardar y salir:	:wq <ENTER>	(en modo Normal)
	Guardar sin salir:	:w  <ENTER>	(en modo Normal)

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
NAVEGACION:
	gg	Ir a primer linea.
	G	Ir a ultima linea.
	nG	Ir a la linea n
	n%	Ir al la linea n-porciento 

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
FORMATO DE COMANDOS:
	En modo normal el formato de comandos es:
	[numero] comando objeto

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
NUMEROS:
	Presionando un numero (n) antes de un comando indicamos que tal comando sea repetido n veces.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
OBJETOS:
    w 	- hasta final de palabra (incluye espacio final).
    e   - hasta final de palabra (no incluye espacio final).
    $ 	- hasta final de linea.

	Hay expeciones, por ejemplo:
		dd
		
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
COPY/PASTE:
	y	copiar 
	Y	copiar linea
	p	pegar a continuación
	P	pegar antes de cursor

	** (en realidad dd es una forma de CORTAR)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
REMPLAZAR:
	r	remplazar caracter.
	R	entrar en modo REMPLAZO.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CAMBIAR:
	cw	cambiar caracteres hasta el final de palabra (los borra y entra a insert/mode)
	c[N]w	cambiar N palabras siguientes.
	C	cambiar hasta final de la linea (igual que c$)


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		     Lesson 4.1: LOCATION AND FILE STATUS


  ** Type CTRL-g to show your location in the file and the file status.
     Type SHIFT-G to move to a line in the file. **

  Note: Read this entire lesson before executing any of the steps!!

  1. Hold down the Ctrl key and press  g .  A status line will appear at the
     bottom of the page with the filename and the line you are on.  Remember
     the line number for Step 3.

  2. Press shift-G to move you to the bottom of the file.

  3. Type in the number of the line you were on and then shift-G.  This will
     return you to the line you were on when you first pressed Ctrl-g.
     (When you type in the numbers, they will NOT be displayed on the screen.)

  4. If you feel confident to do this, execute steps 1 through 3.



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			Lesson 4.2: THE SEARCH COMMAND


     ** Type  /  followed by a phrase to search for the phrase. **

  1. In Normal mode type the  /  character.  Notice that it and the cursor
     appear at the bottom of the screen as with the  :	command.

  2. Now type 'errroor' <ENTER>.  This is the word you want to search for.

  3. To search for the same phrase again, simply type  n .
     To search for the same phrase in the opposite direction, type  Shift-N .

  4. If you want to search for a phrase in the backwards direction, use the
     command  ?  instead of /.

---> When the search reaches the end of the file it will continue at the start.

  "errroor" is not the way to spell error;  errroor is an error.



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		   Lesson 4.3: MATCHING PARENTHESES SEARCH


	      ** Type  %  to find a matching ),], or } . **

  1. Place the cursor on any (, [, or { in the line below marked --->.

  2. Now type the  %  character.

  3. The cursor should be on the matching parenthesis or bracket.

  4. Type  %  to move the cursor back to the first bracket (by matching).

---> This ( is a test line with ('s, ['s ] and {'s } in it. ))

Note: This is very useful in debugging a program with unmatched parentheses!






~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		      Lesson 4.4: A WAY TO CHANGE ERRORS


	** Type  :s/old/new/g  to substitute 'new' for 'old'. **

  1. Move the cursor to the line below marked --->.

  2. Type  :s/thee/the <ENTER> .  Note that this command only changes the
     first occurrence on the line.

  3. Now type	 :s/thee/the/g	   meaning substitute globally on the line.
     This changes all occurrences on the line.

---> thee best time to see thee flowers is in thee spring.

  4. To change every occurrence of a character string between two lines,
     type   :#,#s/old/new/g    where #,# are the numbers of the two lines.
     Type   :%s/old/new/g    to change every occurrence in the whole file.




~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			       LESSON 4 SUMMARY


  1. Ctrl-g  displays your location in the file and the file status.
     Shift-G  moves to the end of the file.  A line number followed
     by  Shift-G  moves to that line number.

  2. Typing  /	followed by a phrase searches FORWARD for the phrase.
     Typing  ?	followed by a phrase searches BACKWARD for the phrase.
     After a search type  n  to find the next occurrence in the same direction
     or  Shift-N  to search in the opposite direction.

  3. Typing  %	while the cursor is on a  (,),[,],{, or }  locates its
     matching pair.

  4. To substitute new for the first old on a line type    :s/old/new
     To substitute new for all 'old's on a line type	   :s/old/new/g
     To substitute phrases between two line #'s type	   :#,#s/old/new/g
     To substitute all occurrences in the file type	   :%s/old/new/g
     To ask for confirmation each time add 'c'		   :%s/old/new/gc


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		Lesson 5.1: HOW TO EXECUTE AN EXTERNAL COMMAND


   ** Type  :!	followed by an external command to execute that command. **

  1. Type the familiar command	:  to set the cursor at the bottom of the
     screen.  This allows you to enter a command.

  2. Now type the  !  (exclamation point) character.  This allows you to
     execute any external shell command.

  3. As an example type   ls   following the ! and then hit <ENTER>.  This
     will show you a listing of your directory, just as if you were at the
     shell prompt.  Or use   :!dir  if ls doesn't work.

---> Note:  It is possible to execute any external command this way.

---> Note:  All  :  commands must be finished by hitting <ENTER>




~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		      Lesson 5.2: MORE ON WRITING FILES


     ** To save the changes made to the file, type  :w FILENAME. **

  1. Type  :!dir  or  :!ls  to get a listing of your directory.
     You already know you must hit <ENTER> after this.

  2. Choose a filename that does not exist yet, such as TEST.

  3. Now type:	 :w TEST   (where TEST is the filename you chose.)

  4. This saves the whole file	(Vim Tutor)  under the name TEST.
     To verify this, type    :!dir   again to see your directory

---> Note that if you were to exit Vim and enter again with the filename TEST,
     the file would be an exact copy of the tutor when you saved it.

  5. Now remove the file by typing (MS-DOS):    :!del TEST



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		    Lesson 5.3: A SELECTIVE WRITE COMMAND


	** To save part of the file, type   :#,# w FILENAME **

  1. Once again, type  :!dir  or  :!ls  to obtain a listing of your directory
     and choose a suitable filename such as TEST.

  2. Move the cursor to the top of this page and type  Ctrl-g  to find the
     number of that line.  REMEMBER THIS NUMBER!

  3. Now move to the bottom of the page and type  Ctrl-g again.  REMEMBER THIS
     LINE NUMBER ALSO!

  4. To save ONLY a section to a file, type   :#,# w TEST   where #,# are
     the two numbers you remembered (top,bottom) and TEST is your filename.

  5. Again, see that the file is there with  :!dir  but DO NOT remove it.




~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		   Lesson 5.4: RETRIEVING AND MERGING FILES


       ** To insert the contents of a file, type   :r FILENAME **

  1. Type   :!dir   to make sure your TEST filename is present from before.

  2. Place the cursor at the top of this page.

NOTE:  After executing Step 3 you will see Lesson 5.3.	Then move DOWN to
       this lesson again.

  3. Now retrieve your TEST file using the command   :r TEST   where TEST is
     the name of the file.

NOTE:  The file you retrieve is placed starting where the cursor is located.

  4. To verify that a file was retrieved, cursor back and notice that there
     are now two copies of Lesson 5.3, the original and the file version.



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			       LESSON 5 SUMMARY


  1.  :!command  executes an external command.

      Some useful examples are (MS-DOS):
	  :!dir			-  shows a directory listing.
	  :!del FILENAME	-  removes file FILENAME.

  2.  :w FILENAME  writes the current Vim file to disk with name FILENAME.

  3.  :#,#w FILENAME  saves the lines # through # in file FILENAME.

  4.  :r FILENAME  retrieves disk file FILENAME and inserts it into the
      current file following the cursor position.







~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			 Lesson 6.1: THE OPEN COMMAND


 ** Type  o  to open a line below the cursor and place you in Insert mode. **

  1. Move the cursor to the line below marked --->.

  2. Type  o (lowercase) to open up a line BELOW the cursor and place you in
     Insert mode.

  3. Now copy the line marked ---> and press <ESC> to exit Insert mode.

---> After typing  o  the cursor is placed on the open line in Insert mode.

  4. To open up a line ABOVE the cursor, simply type a capital	O , rather
     than a lowercase  o.  Try this on the line below.
Open up a line above this by typing Shift-O while the cursor is on this line.





~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			Lesson 6.2: THE APPEND COMMAND


	     ** Type  a  to insert text AFTER the cursor. **

  1. Move the cursor to the end of the first line below marked ---> by
     typing  $	in Normal mode.

  2. Type an  a  (lowercase) to append text AFTER the character under the
     cursor.  (Uppercase  A  appends to the end of the line.)

Note: This avoids typing  i , the last character, the text to insert, <ESC>,
      cursor-right, and finally, x , just to append to the end of a line!

  3. Now complete the first line.  Note also that append is exactly the same
     as Insert mode, except for the location where text is inserted.

---> This line will allow you to practice
---> This line will allow you to practice appending text to the end of a line.



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		    Lesson 6.3: ANOTHER VERSION OF REPLACE


      ** Type a capital  R  to replace more than one character. **

  1. Move the cursor to the first line below marked --->.

  2. Place the cursor at the beginning of the first word that is different
     from the second line marked ---> (the word 'last').

  3. Now type  R  and replace the remainder of the text on the first line by
     typing over the old text to make the first line the same as the second.

---> To make the first line the same as the last on this page use the keys.
---> To make the first line the same as the second, type R and the new text.

  4. Note that when you press <ESC> to exit, any unaltered text remains.





~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			    Lesson 6.4: SET OPTION


	  ** Set an option so a search or substitute ignores case **


  1. Search for 'ignore' by entering:
     /ignore
     Repeat several times by hitting the n key

  2. Set the 'ic' (Ignore case) option by typing:
     :set ic

  3. Now search for 'ignore' again by entering: n
     Repeat search several more times by hitting the n key

  4. Set the 'hlsearch' and 'incsearch' options:
     :set hls is

  5. Now enter the search command again, and see what happens:
     /ignore

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			       LESSON 6 SUMMARY


  1. Typing  o	opens a line BELOW the cursor and places the cursor on the open
     line in Insert mode.
     Typing a capital  O  opens the line ABOVE the line the cursor is on.

  2. Type an  a  to insert text AFTER the character the cursor is on.
     Typing a capital  A  automatically appends text to the end of the line.

  3. Typing a capital  R  enters Replace mode until  <ESC>  is pressed to exit.

  4. Typing ":set xxx" sets the option "xxx"









~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		       LESSON 7: ON-LINE HELP COMMANDS


		      ** Use the on-line help system **

  Vim has a comprehensive on-line help system.  To get started, try one of
  these three:
	- press the <HELP> key (if you have one)
	- press the <F1> key (if you have one)
	- type   :help <ENTER>

  Type   :q <ENTER>   to close the help window.

  You can find help on just about any subject, by giving an argument to the
  ":help" command.  Try these (don't forget pressing <ENTER>):

	:help w
	:help c_<T
	:help insert-index
	:help user-manual


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		       LESSON 8: CREATE A STARTUP SCRIPT

			  ** Switch on Vim features **

  Vim has many more features than Vi, but most of them are disabled by default.
  To start using more features you have to create a "vimrc" file.

  1. Start editing the "vimrc" file, this depends on your system:
	:edit ~/.vimrc			for Unix
	:edit $VIM/_vimrc		for MS-Windows

  2. Now read the example "vimrc" file text:

	:read $VIMRUNTIME/vimrc_example.vim

  3. Write the file with:

	:write

  The next time you start Vim it will use syntax highlighting.
  You can add all your preferred settings to this "vimrc" file.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  This concludes the Vim Tutor.  It was intended to give a brief overview of
  the Vim editor, just enough to allow you to use the editor fairly easily.
  It is far from complete as Vim has many many more commands.  Read the user
  manual next: ":help user-manual".

  For further reading and studying, this book is recommended:
	Vim - Vi Improved - by Steve Oualline
	Publisher: New Riders
  The first book completely dedicated to Vim.  Especially useful for beginners.
  There are many examples and pictures.
  See http://iccf-holland.org/click5.html

  This book is older and more about Vi than Vim, but also recommended:
	Learning the Vi Editor - by Linda Lamb
	Publisher: O'Reilly & Associates Inc.
  It is a good book to get to know almost anything you want to do with Vi.
  The sixth edition also includes information on Vim.

  This tutorial was written by Michael C. Pierce and Robert K. Ware,
  Colorado School of Mines using ideas supplied by Charles Smith,
  Colorado State University.  E-mail: bware@mines.colorado.edu.

  Modified for Vim by Bram Moolenaar.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

