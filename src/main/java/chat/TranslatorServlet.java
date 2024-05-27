package chat;

import com.google.gson.Gson;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/translate")
public class TranslatorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 요청 본문에서 데이터 추출
        String textToTranslate = request.getParameter("text");
        String sourceLang = request.getParameter("source");
        String targetLang = request.getParameter("target");

        // HTTP 클라이언트 생성
        HttpClient client = HttpClient.newHttpClient();

        // 요청 데이터 설정
        Map<String, String> requestData = new HashMap<>();
        requestData.put("q", textToTranslate);
        requestData.put("source", sourceLang);
        requestData.put("target", targetLang);
        requestData.put("format", "text");

        // JSON으로 변환
        Gson gson = new Gson();
        String json = gson.toJson(requestData);

        // HTTP 요청 생성
        HttpRequest httpRequest = HttpRequest.newBuilder()
            .uri(URI.create("https://libretranslate.com/translate"))
            .header("Content-Type", "application/json")
            .POST(HttpRequest.BodyPublishers.ofString(json))
            .build();

        // HTTP 응답 받기
        HttpResponse<String> httpResponse;
        try {
            httpResponse = client.send(httpRequest, HttpResponse.BodyHandlers.ofString());
        } catch (InterruptedException e) {
            throw new ServletException("HTTP 요청 중 오류 발생", e);
        }

        // 응답 출력
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(httpResponse.body());
        out.flush();
    }
}
