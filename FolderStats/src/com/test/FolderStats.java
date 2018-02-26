package com.test;

import java.io.File;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.Map;

public class FolderStats {
public Long size;
public Map<String,Long>countByType=null;

FolderStats calculateStatus(String pathToFolder){
	try {
		
	
	File directory=new File(pathToFolder);
	countByType=new HashMap<String,Long>();
	size = this.folderSize(directory);
	} catch (Exception e) {
	}
	return this;
} 
public long folderSize(File directory) {
    long length = 0;
    
    for (File file : directory.listFiles()) {
        if (file.isFile()){
            length += file.length();
            String fileName=file.getName();
            String extension = "";
            int i = fileName.lastIndexOf('.');
            if (i > 0){
                extension = fileName.substring(i+1);
            	if(countByType.containsKey(extension)){
            		long count=countByType.get(extension);
            		count++;
            		countByType.replace(extension, count);
            	}else{
            		countByType.put(extension, 1L);
            		
            	}
            }
        }else{
            length += folderSize(file);
        }
    }
    return length;
}
	public static void main(String[] args) {

	}

}
