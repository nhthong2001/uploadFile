package com.example.uploadfile;


import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@Controller
public class InfoController {
    @RequestMapping("/")
    public String register() {
        return "info";
    }

    @PostMapping("/save")
    public String save(@RequestParam("name") String name,
                       @RequestParam("photo") MultipartFile photo,
                       @RequestParam("filecv") MultipartFile fileCv,
                       ModelMap model) {
        Info info = new Info();
        info.setName(name);
        if (photo.isEmpty() || fileCv.isEmpty()) {
            return "info";
        }

        Path path = Paths.get("uploads/");
        try {
            InputStream inputStream = photo.getInputStream();
            Files.copy(inputStream, path.resolve(photo.getOriginalFilename()), StandardCopyOption.REPLACE_EXISTING);
            info.setPhoto(photo.getOriginalFilename().toLowerCase());

            inputStream = fileCv.getInputStream();
            Files.copy(inputStream, path.resolve(fileCv.getOriginalFilename()), StandardCopyOption.REPLACE_EXISTING);
            model.addAttribute("INFO", info);
            model.addAttribute("FILE_NAME", fileCv.getOriginalFilename());
            model.addAttribute("FILE_TYPE", fileCv.getContentType());
            model.addAttribute("FILE_SIZE", fileCv.getSize());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "view-info";
    }
}
