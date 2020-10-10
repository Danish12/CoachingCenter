package com.fagnum.services.service;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.fagnum.services.util.Constants;

//@Service
public class VideoStreamService {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * Prepare the content.
     *
     * @param fileName String.
     * @param fileType String.
     * @param range    String.
     * @return ResponseEntity.
     */
    public ResponseEntity<byte[]> prepareContent(String fileName, String range) {
        long rangeStart = 0;
        long rangeEnd = 0;
        byte[] data;
        Long fileSize = null;
        String fullFileName = fileName + ".mp4" ;
        try {
            fileSize = getFileSize(fullFileName);
            /*if (range == null) {
                return ResponseEntity.status(HttpStatus.OK)
                        .header(CONTENT_TYPE, VIDEO_CONTENT + fileType)
                        .header(CONTENT_LENGTH, String.valueOf(fileSize))
                        .body(readByteRange(fullFileName, rangeStart, fileSize - 1)); // Read the object and convert it as bytes
            }*/
            String[] ranges = range.split("-");
            rangeStart = Long.parseLong(ranges[0].substring(6));
            if (ranges.length > 1) {
                rangeEnd = Long.parseLong(ranges[1]);
            } else {
                rangeEnd = fileSize - 1;
            }
            if (fileSize < rangeEnd) {
                rangeEnd = fileSize - 1;
            }
            data = readByteRange(fullFileName, rangeStart, rangeEnd);
            String contentLength = String.valueOf((rangeEnd - rangeStart) + 1);

            
            HttpHeaders headers = new HttpHeaders();
            headers.set(Constants.CONTENT_TYPE, Constants.VIDEO_CONTENT + "mp4");
            headers.set(Constants.ACCEPT_RANGES, Constants.BYTES);
            headers.set(Constants.CONTENT_LENGTH, contentLength);
            headers.set(Constants.CONTENT_RANGE, Constants.BYTES + " " + rangeStart + "-" + rangeEnd + "/" + fileSize);
            
            return new ResponseEntity<byte[]>(data, headers, HttpStatus.OK);
        } catch (IOException e) {
            logger.error("Exception while reading the file {}", e.getMessage());
            e.printStackTrace();
            //return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
        return null;
    }

    /**
     * ready file byte by byte.
     *
     * @param filename String.
     * @param start    long.
     * @param end      long.
     * @return byte array.
     * @throws IOException exception.
     */
    public byte[] readByteRange(String filename, long start, long end) throws IOException {
        Path path = Paths.get(Constants.VIDEO, filename);
        try (InputStream inputStream = (Files.newInputStream(path));
             ByteArrayOutputStream bufferedOutputStream = new ByteArrayOutputStream()) {
            byte[] data = new byte[Constants.BYTE_RANGE];
            int nRead;
            while ((nRead = inputStream.read(data, 0, data.length)) != -1) {
                bufferedOutputStream.write(data, 0, nRead);
            }
            bufferedOutputStream.flush();
            byte[] result = new byte[(int) (end - start) + 1];
            System.arraycopy(bufferedOutputStream.toByteArray(), (int) start, result, 0, result.length);
            return result;
        }
    }

    /**
     * Content length.
     *
     * @param fileName String.
     * @return Long.
     * @throws MalformedURLException 
     */
    public Long getFileSize(String fileName) throws MalformedURLException {
        return  new File(Constants.VIDEO+fileName).length();
    }

}