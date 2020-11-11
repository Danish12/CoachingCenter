package com.fagnum.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fagnum.services.service.VideoStreamService;

@Controller
@RequestMapping
public class VideoStreamController {

    @RequestMapping("/stream/{fileName}")
    public ResponseEntity<byte[]> streamVideo(@RequestHeader(value = "Range", required = false) String httpRangeList,
                                                    @PathVariable("fileName") String fileName) {
        return new VideoStreamService().prepareContent(fileName, httpRangeList);
    }
}
