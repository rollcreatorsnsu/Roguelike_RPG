function scr_getFilesByMask(files, mask){
	filename = file_find_first(mask, 0)
	i = 0
	while (filename != "") {		
		files[i] = filename
		i++
		filename = file_find_next()
	}
	return i
}