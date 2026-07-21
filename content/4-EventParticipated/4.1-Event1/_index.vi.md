---
title: "Event 1"
date: 2026-05-04
weight: 1
chapter: false
pre: " <b> 4.1. </b> "
---

# 05-23-2026 | FCAJ Community Day

**Thời gian:** Sự kiện diễn ra vào sáng ngày 23/05/2026.  
**Địa điểm:** Tầng 26, Tháp tài chính Bitexco, Số 02 Hải Triều, Phường Bến Nghé, Quận 1, TP. HCM.  
**Đơn vị tổ chức:** Cộng đồng FCAJ (AWS Study Group).

### Mục đích của sự kiện
Ban tổ chức không định hướng sự kiện như một buổi hội thảo thuần túy nơi mọi người chỉ ngồi và nghe. Ngay từ đầu, tinh thần chung là khuyến khích mọi người chủ động bắt chuyện, xem đây là cơ hội để kết nối và tìm kiếm bạn bè hoặc đối tác mới, thay vì chỉ đến dự rồi về.

Nội dung chính đi qua sáu phiên chia sẻ, trải dài từ AI, Cloud đến các câu chuyện thực tế từ những chuyên gia trong ngành. Trọng tâm xoay quanh cách thích ứng với thị trường lao động đang thay đổi trong kỷ nguyên AI, kiến trúc AWS với CloudFront và Amazon Q, cách viết prompt có ngữ cảnh thay vì hỏi chung chung, bản chất xác suất của các LLMs, kinh nghiệm tham gia Hackathon, và cách thiết kế hệ thống Multi-Agent chuẩn doanh nghiệp. Giá trị lớn nhất mà sự kiện mang lại, theo em, là góc nhìn thực tiễn từ những người trực tiếp làm dự án, giúp người tham dự hiểu được cách vận hành một hệ thống an toàn, đáng tin cậy và đáp ứng đúng nhu cầu người dùng, thay vì chỉ là kiến thức lý thuyết.

### Danh sách các diễn giả

- **Quỳnh Mai**: MC của chương trình
- **Nguyễn Gia Hưng**: Head of Solution Architect tại AWS Vietnam, Founder của FCAJ
- **Anh Tính**: Platform Engineer tại Gotam X
- **Chị Hải Anh**: Làm việc tại Pacific Vietnam (Đã từng trình bày tại AWS Singapore Summit, Silicon Valley)
- **Anh Thịnh**: DevOps Engineer
- **Đội UTM**: Các bạn lập trình viên (chia sẻ về dự án Hackathon của họ)
- **Anh Đức**: Chia sẻ kiến thức kỹ thuật sâu về Large Language Models (Tối ưu hóa LLM)
- **Chị Vy**: Làm việc tại VPBank, chia sẻ về hệ thống Enterprise Multi-agent

### Những điểm nổi bật chính
Điểm chung của cả sáu phiên là không né tránh những vấn đề đang thực sự gây đau đầu cho ngành. Ngành IT nói chung đang khá hoang mang trước sự phát triển quá nhanh của AI, trong khi nhiều kỹ sư vẫn giữ thói quen sử dụng prompt không có ngữ cảnh và bất ngờ khi AI đưa ra câu trả lời hoàn toàn sai, còn gọi là "hallucinations". Bên cạnh đó là bài toán quản lý chi phí Cloud khi hóa đơn tăng vọt bất thường, việc các LLMs trả về kết quả khác nhau ngay cả khi nhiệt độ (temperature) đã được cố định ở mức 0, và câu chuyện thiếu dữ liệu báo cáo tài chính khi chấm điểm tín dụng cho các doanh nghiệp startup.

Về giải pháp, các diễn giả đều nhấn mạnh một điểm chung: bạn nên xây dựng một sản phẩm thực tế để ghi điểm, thay vì chỉ làm một dự án demo cho có. Nếu muốn AI trả lời đúng, bạn phải cung cấp cho nó bối cảnh cụ thể của doanh nghiệp thay vì kiến thức chung chung. Về chi phí, bạn có thể sử dụng cơ chế định giá Flat-rate của CloudFront để vừa tối ưu hóa chi phí vừa chống DDoS. Đối với các bài toán phức tạp, thay vì ép một AI làm mọi thứ, nó nên được chia nhỏ thành một hệ thống Multi-agent, với mỗi agent phụ trách một chuyên môn nhất định.

Về các công nghệ được nhắc đến, ở phía AWS, có Amazon Q (QuickSight) và Amazon CloudFront với các lớp bảo vệ như OAC, Shield, và WAF. Ở phía AI, có CrewAI, Bedrock Agent Core, các tham số LLM như Temperature, Logits, Soft max, Arg max, và Model Context Protocol (MCP). Về phần hạ tầng, Terraform được nhắc đến như là công cụ chính cho Infrastructure as Code.

Phần demo và case study có lẽ là phần em sẽ nhớ lâu nhất. Anh Hưng đã demo việc Amazon Q trực tiếp import một file báo cáo kinh doanh Excel và tự động tạo ra một dashboard phân tích. Đội UTM đã kể lại quá trình làm "UTM Morpo" cho cuộc thi Hackathon, một ứng dụng tự động tạo giao diện từ hình ảnh và cho phép kéo thả, chỉnh sửa code ngay lập tức. Có một màn demo hosting hai mô hình LLM song song, một chạy trên AWS Bedrock, một chạy Locally, cả hai đều set temperature là 0 để so sánh xem kết quả có thực sự nhất quán như lý thuyết nói hay không. Chị Vy đã nói về việc xây dựng hệ thống Multi-agent để đánh giá tín dụng startup tại ngân hàng nơi chị làm việc.

Một chi tiết khiến cả hội trường bật cười nhưng cũng gật gù đồng ý là "căn bệnh Internet Builder", tức là thói quen cứ thấy công cụ, luật, hay đoạn code nào trên mạng là kéo về xài mà không suy xét xem nó có phù hợp với dự án của công ty hay không. Chị Vy cũng chia sẻ về mức độ bảo mật khắt khe ở ngân hàng: nếu ai tự ý cài đặt MCP, đội ngũ Security sẵn sàng tịch thu máy ngay tại chỗ.

### Những gì em học được
Về tư duy, em đã rút ra một kết luận khá rõ ràng: AI không thay thế con người, mà nó đang tạo ra một luồng công việc mới, cụ thể là công việc "sửa lỗi" và bảo trì các sản phẩm do chính AI tạo ra. Khi thiết kế bất kỳ hệ thống nào, bạn phải trả lời bốn câu hỏi: ai dùng, dùng cái gì, tại sao dùng, và khi nào dùng, thay vì cứ làm ra rồi mới đi tìm người dùng.

Về kiến thức kỹ thuật, em đã hiểu rõ hơn về khái niệm Platform Engineer, nghĩa là người tạo ra một nền tảng dành cho lập trình viên nội bộ (IDP) để các lập trình viên khác có thể tự cung cấp tài nguyên mà không cần chờ phê duyệt thủ công. Em cũng nắm được lý do tại sao kết quả của LLM không bao giờ giống nhau tuyệt đối, xuất phát từ cơ chế tối ưu hóa chi phí hạ tầng, gọi là inference optimization, được các nhà cung cấp mô hình áp dụng.

Về best practices, thay vì nhồi nhét càng nhiều tài liệu càng tốt vào AI, nên chắt lọc thành "knowledge transfer" từ chính các chuyên gia trong ngành. Việc rotating security keys, nghĩa là thay đổi định kỳ các API Keys hoặc IAM Access Keys, cũng được nhắc đi nhắc lại như một thói quen bắt buộc chứ không phải là một tùy chọn, vì sự lơ là ở đây có thể gây thiệt hại hàng tỷ đồng. Một ý tưởng hay khác là nên có một Agent chuyên trách chỉ làm nhiệm vụ kiểm tra và đối chiếu kết quả của các AI khác, thay vì tin tưởng tuyệt đối vào một nguồn duy nhất.

Về kinh nghiệm thực tế, các diễn giả đã cảnh báo thẳng thắn rằng việc copy-paste code từ AI mà không hiểu các tiêu chuẩn coding của công ty rất dễ gây ra các lỗi nghiêm trọng ngay trên production. Và có một điều em thấy quan trọng cần nhớ: khi một người dựa vào kết quả của AI để đưa ra quyết định, người đó phải hoàn toàn chịu trách nhiệm pháp lý nếu sai, không thể đổ lỗi ngược lại cho AI.

### Ứng dụng vào công việc
Với công việc hiện tại, em nghĩ mình có thể áp dụng ngay việc viết lại các prompts sao cho bám sát với domain và quy trình thực tế của team, thay vì hỏi chung chung và phải thất vọng với những câu trả lời mơ hồ. Một điều nhỏ nhưng hữu ích là nên điều chỉnh temperature ở mức khoảng 0.1 thay vì để tuyệt đối là 0, vì để 0 đôi khi khiến LLM lặp lại từ vựng một cách máy móc.

Về những công nghệ em muốn thử, em rất hứng thú với việc dùng Terraform để quản lý hạ tầng bằng code thay vì click thủ công trên console, vì cách này giúp cho việc rollback hoặc scale sau này dễ dàng hơn rất nhiều. Em cũng muốn thử Amazon Q trong vai trò một trợ lý tóm tắt các cuộc họp và tự động gửi chúng qua Teams hoặc Email.

Về cải thiện luồng công việc, ý tưởng xây dựng một hệ thống Multi-Agent chia theo tác vụ, ví dụ một agent để nghiên cứu, một agent để đánh giá rủi ro, một agent chuyên để review, là điều em muốn tìm hiểu thêm. Đi cùng với đó là thói quen thực hiện đánh giá ROI (Return on Investment) trước khi đề xuất bất kỳ dự án AI nào với cấp trên, thay vì chỉ đơn thuần là trình bày ý tưởng.

### Trải nghiệm tại sự kiện
Điều em học được nhiều nhất từ các diễn giả là những lời khuyên rất "thực chiến", đến từ những người đang trực tiếp vận hành các hệ thống lớn, giúp em nhìn rõ khoảng cách giữa việc làm đồ án trường và làm sản phẩm thực tế cho doanh nghiệp. Phần thực hành trực quan cũng để lại ấn tượng, đặc biệt là việc tạo dashboard bằng giọng nói hay tự động sinh layout web từ wireframe và chỉnh sửa ngay tại chỗ.

Không khí giao lưu khá thoải mái, các diễn giả thân thiện và luôn khuyến khích mọi người mạnh dạn giơ tay phát biểu, vừa để tích lũy điểm cộng cho CV, vừa có cơ hội nhận các AWS credits. Điều làm em ấn tượng nhất là sự chia sẻ khá thẳng thắn rằng các nhà tuyển dụng ngày nay nhìn vào các sản phẩm thực tế nhiều hơn là điểm số trên bảng điểm, cùng với câu chuyện có thật về việc copy code từ ChatGPT đã gây ra một sự cố tại VPBank.

### Bài học rút ra
Bài học lớn nhất em mang về là nền tảng kỹ thuật phần mềm mới chính là yếu tố cốt lõi giúp một mô hình AI chạy an toàn và có thể mở rộng trên production, chứ không chỉ đơn thuần là biết cách gọi APIs. Bằng cấp và những kỹ năng nền tảng cũ vẫn quan trọng, ít nhất là để vượt qua vòng lọc hồ sơ ban đầu.

Một câu nói mà em sẽ nhớ mãi là "garbage in, garbage out": nếu dữ liệu đưa vào là rác, thì kết quả AI trả về cũng chỉ là rác, bất kể mô hình đó mạnh đến đâu. Và khi có quá nhiều ý tưởng cùng lúc, cách tốt nhất không phải là ôm đồm tất cả, mà là cắt giảm đi, tập trung vào hoàn thiện một luồng tính năng cốt lõi duy nhất để đảm bảo giao hàng đúng tiến độ (on-time delivery).

Về định hướng sắp tới, em muốn cải thiện tư duy về việc áp dụng AI vào công việc thực tế một cách hệ thống hơn, thay vì chỉ dừng lại ở việc biết cách sử dụng. Quan trọng hơn, em nhận ra sự cần thiết phải làm chủ hoàn toàn một nền tảng Cloud, ở đây là AWS, đi kèm với kiến thức bảo mật như IAM và các công cụ như Terraform, thay vì chỉ học AI một cách hời hợt. Và dù hệ thống có phức tạp đến đâu, thì ba chữ cần nhớ luôn là an toàn, đáng tin cậy, và phục vụ đúng người dùng.

### Một số hình ảnh tại sự kiện

![FCAJ Community Day 1](/images/4-EventParticipated/4.1-Event1/media__1783233714015.png)
![FCAJ Community Day 2](/images/4-EventParticipated/4.1-Event1/media__1783233716737.png)
![FCAJ Community Day 3](/images/4-EventParticipated/4.1-Event1/media__1783233719861.png)
![FCAJ Community Day 4](/images/4-EventParticipated/4.1-Event1/media__1783233722968.jpg)

