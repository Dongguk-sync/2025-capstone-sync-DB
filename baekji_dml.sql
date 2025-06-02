USE baekjidb;

-- [1] 사용자 5명 (학습률 포함)
INSERT INTO user (user_id, user_email, user_password, user_name, user_created_at, user_profile_url, user_phone_number, user_nickname, user_studied_days, user_total_reviews, user_completed_reviews, user_progress_rate) VALUES
(1, 'gildong@example.com', '$2a$10$uumw1vnFSE5ej.HpsHI4uOfG/2hB3bqv62gW1Gevf1ZMIS7KJkvxy', '홍백지', NOW(), 'https://baekji-bucket.s3.ap-northeast-2.amazonaws.com/user_basic_profile.png', '01012345678', '백지이' ,0, 5, 3, 60.0),
(2, 'minsu@example.com', '$2a$10$uumw1vnFSE5ej.HpsHI4uOfG/2hB3bqv62gW1Gevf1ZMIS7KJkvxy', '김민수', NOW(), 'https://baekji-bucket.s3.ap-northeast-2.amazonaws.com/user_basic_profile.png', '01023456789', '민수짱', 0, 10, 7, 70.0),
(3, 'yuna@example.com', '$2a$10$uumw1vnFSE5ej.HpsHI4uOfG/2hB3bqv62gW1Gevf1ZMIS7KJkvxy', '박유나', NOW(), 'https://baekji-bucket.s3.ap-northeast-2.amazonaws.com/user_basic_profile.png', '01034567890', '유나짱', 0, 8, 4, 50.0),
(4, 'seojin@example.com', '$2a$10$uumw1vnFSE5ej.HpsHI4uOfG/2hB3bqv62gW1Gevf1ZMIS7KJkvxy', '이서진', NOW(), 'https://baekji-bucket.s3.ap-northeast-2.amazonaws.com/user_basic_profile.png', '01045678901', '서진쓰', 0, 6, 6, 100.0),
(5, 'jihye@example.com', '$2a$10$uumw1vnFSE5ej.HpsHI4uOfG/2hB3bqv62gW1Gevf1ZMIS7KJkvxy', '최지혜', NOW(), 'https://baekji-bucket.s3.ap-northeast-2.amazonaws.com/user_basic_profile.png', '01056789012', '지혜짱', 0, 9, 5, 55.6);

-- [2] 과목 5개
INSERT INTO subject (subject_id, subject_name, created_at, user_id) VALUES
(1, '자료구조', NOW(), 1),
(2, '알고리즘', NOW(), 2),
(3, '네트워크', NOW(), 3),
(4, '운영체제', NOW(), 4),
(5, '데이터베이스', NOW(), 5);

-- [3] 답안 파일 5개
INSERT INTO answer_files (file_id, file_name, file_content, file_type, file_url, created_at, subject_id) VALUES
(1, '자료구조_기말_정답.txt', '정답 내용 예시 1', 'text', '/subjects/1/files/1', NOW(), 1),
(2, '알고리즘_기말_정답.txt', '정답 내용 예시 2', 'text', '/subjects/2/files/1', NOW(), 2),
(3, '네트워크_기말_정답.txt', '정답 내용 예시 3', 'text', '/subjects/3/files/1', NOW(), 3),
(4, '운영체제_기말_정답.txt', '정답 내용 예시 4', 'text', '/subjects/4/files/1', NOW(), 4),
(5, '데이터베이스_기말_정답.txt', '정답 내용 예시 5', 'text', '/subjects/5/files/1', NOW(), 5);

-- [4] 챗봇 히스토리 5개
INSERT INTO chat_bot_history (chat_bot_history_id, history_first_question, history_created_at, user_id) VALUES
(1, '퀵 정리된 요약 보여줘', NOW(), 1),
(2, '주요 개념 정리해줘', NOW(), 2),
(3, '예상 문제 알려줘', NOW(), 3),
(4, '기출 문제 풀어줘', NOW(), 4),
(5, '필수 암기 내용 알려줘', NOW(), 5);

-- [5] 챗봇 메시지 5개
INSERT INTO chat_bot_messages (bot_message_id, message_type, message_content, message_created_at, subject_name, file_name, file_url, chat_bot_history_id) VALUES
(1, 'AI', '자료구조의 핵심은 트리와 그래프입니다. 다시 복습해볼까요?', NOW(), '자료구조', '자료구조_기말_정답.txt', '/subjects/1/files/1', 1),
(2, 'HUMAN', '트리 구조가 아직 헷갈려요. 좀 더 설명해줄 수 있나요?', NOW(), '알고리즘', '알고리즘_기말_정답.txt', '/subjects/2/files/1', 2),
(3, 'AI', '네트워크의 3계층 모델을 정리해드릴게요. 중요한 건 데이터 전송 과정입니다.', NOW(), '네트워크', '네트워크_기말_정답.txt', '/subjects/3/files/1', 3),
(4, 'AI', '운영체제에서 프로세스와 스레드의 차이를 이해하는 게 중요해요.', NOW(), '운영체제', '운영체제_기말_정답.txt', '/subjects/4/files/1', 4),
(5, 'AI', '데이터베이스 정규화는 데이터 중복을 줄이기 위한 과정입니다. 다시 정리해볼까요?', NOW(), '데이터베이스', '데이터베이스_기말_정답.txt', '/subjects/5/files/1', 5);

-- [6] 시험 일정 5개
INSERT INTO exam_schedule (exam_schedule_id, exam_schedule_date, exam_schedule_name, subject_id, user_id) VALUES
(1, '2025-06-15 10:00:00', '자료구조 기말고사', 1, 1),
(2, '2025-06-16 11:00:00', '알고리즘 기말고사', 2, 2),
(3, '2025-06-17 09:00:00', '네트워크 기말고사', 3, 3),
(4, '2025-06-18 10:30:00', '운영체제 기말고사', 4, 4),
(5, '2025-06-19 14:00:00', '데이터베이스 기말고사', 5, 5);

-- [7] 학습 일정 5개 (COMP/UNCOMP 적용)
INSERT INTO study_schedule (study_schedule_id, study_schedule_date, study_schedule_completed, study_schedule_created_at, user_id, file_id, subject_id) VALUES
(1, '2025-06-10 09:00:00', 'COMP', NOW(), 1, 1, 1),
(2, '2025-06-11 09:00:00', 'COMP', NOW(), 2, 2, 2),
(3, '2025-06-12 09:00:00', 'COMP', NOW(), 3, 3, 3),
(4, '2025-06-13 09:00:00', 'COMP', NOW(), 4, 4, 4),
(5, '2025-06-14 09:00:00', 'COMP', NOW(), 5, 5, 5);

-- [8] 학습 기록
INSERT INTO studys (studys_id, studys_stt_content, studys_feed_content, studys_subject_name, studys_created_at, studys_round, study_schedule_id, file_id) VALUES
(1, '자료구조 챕터 1 음성 인식 내용 - 1회차', '좋은 복습이었어요!', '자료구조', NOW(), 1, 1, 1),
(2, '자료구조 챕터 1 음성 인식 내용 - 2회차', '복습 2회차 좋았어요!', '자료구조', NOW(), 2, 1, 1),
(3, '자료구조 챕터 1 음성 인식 내용 - 3회차', '복습 3회차 좋아요!', '자료구조', NOW(), 3, 1, 1),
(4, '알고리즘 챕터 2 음성 인식 내용 - 1회차', '아주 유익했어요.', '알고리즘', NOW(), 1, 2, 2),
(5, '알고리즘 챕터 2 음성 인식 내용 - 2회차', '2회차도 잘했어요.', '알고리즘', NOW(), 2, 2, 2),
(6, '네트워크 챕터 3 음성 인식 내용 - 1회차', '더 복습해야겠어요.', '네트워크', NOW(), 1, 3, 3),
(7, '운영체제 챕터 4 음성 인식 내용 - 1회차', '완벽했어요.', '운영체제', NOW(), 1, 4, 4),
(8, '운영체제 챕터 4 음성 인식 내용 - 2회차', '정말 잘했어요.', '운영체제', NOW(), 2, 4, 4),
(9, '데이터베이스 챕터 5 음성 인식 내용 - 1회차', '정리가 잘 됐어요.', '데이터베이스', NOW(), 1, 5, 5);

-- [9] 학습 메시지 (리얼 학습 대화 느낌으로 수정)
INSERT INTO study_messages (sm_id, message_type, sm_content, sm_subject_name, sm_file_name, sm_file_url, sm_created_at, studys_id) VALUES
(1, 'AI', '자료구조에서 가장 헷갈리는 부분은 어디인가요?', '자료구조', '자료구조_기말_정답.txt', '/subjects/1/files/1', NOW(), 1),
(2, 'HUMAN', '포인터 부분이 어려웠어요. 다시 설명해주세요.', '자료구조', '자료구조_기말_정답.txt', '/subjects/1/files/1', NOW(), 1),
(3, 'AI', '트리 구조는 계층적 구조를 의미해요. 그림으로 그려볼까요?', '자료구조', '자료구조_기말_정답.txt', '/subjects/1/files/1', NOW(), 2),
(4, 'HUMAN', '네, 이진트리 구조가 아직 잘 이해 안돼요.', '자료구조', '자료구조_기말_정답.txt', '/subjects/1/files/1', NOW(), 2),
(5, 'AI', '이번 회차 복습 내용을 다시 요약해볼게요.', '자료구조', '자료구조_기말_정답.txt', '/subjects/1/files/1', NOW(), 3),
(6, 'HUMAN', '요약 정리본 너무 좋아요. 덕분에 복습 잘 됐어요.', '자료구조', '자료구조_기말_정답.txt', '/subjects/1/files/1', NOW(), 3),
(7, 'AI', '알고리즘의 시간복잡도 계산법을 다시 설명할게요.', '알고리즘', '알고리즘_기말_정답.txt', '/subjects/2/files/2', NOW(), 4),
(8, 'HUMAN', '시간복잡도 표 너무 복잡해요. 쉽게 정리해주세요.', '알고리즘', '알고리즘_기말_정답.txt', '/subjects/2/files/2', NOW(), 4),
(9, 'AI', '문제풀이 접근 방법을 바꿔보는 건 어떨까요?', '알고리즘', '알고리즘_기말_정답.txt', '/subjects/2/files/2', NOW(), 5),
(10, 'HUMAN', '그 방법이 더 효율적인 것 같아요.', '알고리즘', '알고리즘_기말_정답.txt', '/subjects/2/files/2', NOW(), 5),
(11, 'AI', '네트워크 3계층 모델을 도식화해서 이해를 도와드릴게요.', '네트워크', '네트워크_기말_정답.txt', '/subjects/3/files/3', NOW(), 6),
(12, 'HUMAN', '도식화 보니까 한눈에 이해됐어요. 감사합니다.', '네트워크', '네트워크_기말_정답.txt', '/subjects/3/files/3', NOW(), 6),
(13, 'AI', '운영체제 스케줄링 알고리즘의 종류를 정리해볼게요.', '운영체제', '운영체제_기말_정답.txt', '/subjects/4/files/4', NOW(), 7),
(14, 'HUMAN', '선점형 스케줄링은 이해했는데, 비선점형은 어려워요.', '운영체제', '운영체제_기말_정답.txt', '/subjects/4/files/4', NOW(), 7),
(15, 'AI', '이번 회차는 데드락 예방에 대해 배웠어요.', '운영체제', '운영체제_기말_정답.txt', '/subjects/4/files/4', NOW(), 8),
(16, 'HUMAN', '데드락 예방 전략 중 어떤 방법이 가장 좋은가요?', '운영체제', '운영체제_기말_정답.txt', '/subjects/4/files/4', NOW(), 8),
(17, 'AI', '데이터베이스 정규화 1NF, 2NF, 3NF 순서로 정리해볼게요.', '데이터베이스', '데이터베이스_기말_정답.txt', '/subjects/5/files/5', NOW(), 9),
(18, 'HUMAN', '정규화 과정을 다시 복습할 수 있어 다행이에요.', '데이터베이스', '데이터베이스_기말_정답.txt', '/subjects/5/files/5', NOW(), 9);

-- ✅ 조회
SELECT * FROM USER; 
SELECT * FROM study_schedule;
SELECT * FROM study_messages;
