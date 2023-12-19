package com.servlet.chat;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.protobuf.ByteString;
import com.google.cloud.vision.v1.Feature.Type;

import javax.swing.*;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/upload.do")
public class UploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String name = request.getParameter("file");
        ServletContext application = getServletContext();
        String path = application.getRealPath("/upload");
        String textResult = "";
        String chatResult="";
        int size = 1024 * 1024 * 100;
        MultipartRequest multi = new MultipartRequest(
                request,
                path,
                size,
                "UTF-8",
                new DefaultFileRenamePolicy());

        String fileName = multi.getFilesystemName("file");
        String picPath = path + "/" + fileName;

        ByteString imgBytes = ByteString.readFrom(new FileInputStream(picPath));

        List<AnnotateImageRequest> requests = new ArrayList<>();
        Image img = Image.newBuilder().setContent(imgBytes).build();
        Feature feat = Feature.newBuilder().setType(Type.TEXT_DETECTION).build();
        AnnotateImageRequest req = AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
        requests.add(req);
        try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
            BatchAnnotateImagesResponse resp = client.batchAnnotateImages(requests);
            List<AnnotateImageResponse> responses = resp.getResponsesList();
            for (AnnotateImageResponse res : responses) {
                if (res.hasError()) {
                    System.out.println(res.getError().getMessage());
                    return;
                }
                textResult = res.getTextAnnotationsList().get(0).getDescription();
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        chatResult = ChatConnect.chatConnect("너는 영어문제를 풀어주는 선생님이야.", textResult+"이 문제에 대한 답에 대한 설명을 한글로 간단히 해줘, 필요하다면 영어도 써도 돼");
        
        
        
        
        textResult = textResult.replace("\n", "<br>");
        request.setAttribute("chatResult", chatResult);
        request.setAttribute("textResult", textResult);
        request.setAttribute("picPath", picPath);

        RequestDispatcher dispatcher = request.getRequestDispatcher("chat/Ocr.jsp");
        dispatcher.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}

