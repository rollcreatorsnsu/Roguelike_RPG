function scr_getFilesByMask(files, mask){
	files[0] = file_find_first(mask, 0)
	i = 1
	do {
		filename = file_find_next()
		files[i] = filename
		i++
	} until (filename != "");
	return i
}