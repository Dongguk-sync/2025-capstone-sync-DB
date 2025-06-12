USE baekjidb;

-- [1] 사용자 5명 (학습률 포함)
INSERT INTO user (user_id, user_email, user_password, user_name, user_created_at, user_profile_url, user_phone_number, user_nickname, user_studied_days, user_total_studys, user_completed_studys, user_progress_rate) VALUES
(1, 'gildong@example.com', '$2a$10$uumw1vnFSE5ej.HpsHI4uOfG/2hB3bqv62gW1Gevf1ZMIS7KJkvxy', '홍백지', NOW(), 'https://baekji-bucket.s3.ap-northeast-2.amazonaws.com/user_basic_profile.png', '01012345678', '백지이' ,0, 5, 3, 60.0),
(2, 'minsu@example.com', '$2a$10$uumw1vnFSE5ej.HpsHI4uOfG/2hB3bqv62gW1Gevf1ZMIS7KJkvxy', '김민수', NOW(), 'https://baekji-bucket.s3.ap-northeast-2.amazonaws.com/user_basic_profile.png', '01023456789', '민수짱', 0, 10, 7, 70.0),
(3, 'yuna@example.com', '$2a$10$uumw1vnFSE5ej.HpsHI4uOfG/2hB3bqv62gW1Gevf1ZMIS7KJkvxy', '박유나', NOW(), 'https://baekji-bucket.s3.ap-northeast-2.amazonaws.com/user_basic_profile.png', '01034567890', '유나짱', 0, 8, 4, 50.0),
(4, 'seojin@example.com', '$2a$10$uumw1vnFSE5ej.HpsHI4uOfG/2hB3bqv62gW1Gevf1ZMIS7KJkvxy', '이서진', NOW(), 'https://baekji-bucket.s3.ap-northeast-2.amazonaws.com/user_basic_profile.png', '01045678901', '서진쓰', 0, 6, 6, 100.0),
(5, 'jihye@example.com', '$2a$10$uumw1vnFSE5ej.HpsHI4uOfG/2hB3bqv62gW1Gevf1ZMIS7KJkvxy', '최지혜', NOW(), 'https://baekji-bucket.s3.ap-northeast-2.amazonaws.com/user_basic_profile.png', '01056789012', '지혜짱', 0, 9, 5, 55.6);

-- [2] 과목 5개
-- INSERT INTO subject (subject_name, created_at, user_id) VALUES
-- ('데이터베이스','2022-11-13 10:00:00', 1), -- id: 1
-- ('알고리즘', '2023-03-14 10:00:00', 1),     -- id: 2
-- ('자료구조', '2025-03-13 10:00:00', 1),     -- id: 3
-- ('운영체제', '2025-04-01 10:00:00', 1),     -- id: 4
-- ('네트워크', '2025-04-15 10:00:00', 1);     -- id: 5

-- [2] 과목 등록 (5개 사용자)
INSERT INTO subject (subject_id, subject_name, created_at, user_id) VALUES
(1, '자료구조', NOW(), 1),
(2, '알고리즘', NOW(), 1),
(3, '운영체제', NOW(), 1),
(4, '네트워크', NOW(), 1),
(5, '데이터베이스', NOW(), 1);

-- 추가 데이터 (user_id 2,3,4,5)
INSERT INTO subject (subject_name, created_at, user_id) VALUES
('알고리즘', '2025-03-13 10:00:00', 2),
('네트워크', '2025-03-13 10:00:00', 3),
('운영체제', '2025-03-13 10:00:00', 4),
('데이터베이스','2025-03-13 10:00:00', 5);


-- [3] 교안 파일 10개 (과목당 2개씩)
INSERT INTO answer_files (file_name, file_content, file_type, file_url, created_at, subject_id) VALUES
('자료구조_스택.txt', '스택 설명입니다.', 'text', '/subjects/1/files/1', NOW(), 1),
('자료구조_큐.txt', '큐 설명입니다.', 'text', '/subjects/1/files/2', NOW(), 1),

('알고리즘_정렬.txt', '정렬 알고리즘 설명입니다.', 'text', '/subjects/2/files/3', NOW(), 2),
('알고리즘_탐색.txt', '탐색 알고리즘 설명입니다.', 'text', '/subjects/2/files/4', NOW(), 2),

('운영체제_프로세스.txt', '프로세스 설명입니다.', 'text', '/subjects/3/files/5', NOW(), 3),
('운영체제_스케줄링.txt', '스케줄링 설명입니다.', 'text', '/subjects/3/files/6', NOW(), 3),

('네트워크_3계층.txt', '3계층 설명입니다.', 'text', '/subjects/4/files/7', NOW(), 4),
('네트워크_전송계층.txt', '전송계층 설명입니다.', 'text', '/subjects/4/files/8', NOW(), 4),

('DB_정규화.txt', '정규화 설명입니다.', 'text', '/subjects/5/files/9', NOW(), 5),
('DB_SQL기초.txt', 'SQL 기초 설명입니다.', 'text', '/subjects/5/files/10', NOW(), 5),


-- [3] 추가 답안 파일 (user_id 2)
('알고리즘_기말_정답.txt', '정답 내용 예시 6', 'text', '/subjects/6/files/11', '2025-03-13 10:00:00', 6),

-- [3] 추가 답안 파일 (user_id 3)
('네트워크_기말_정답.txt', '정답 내용 예시 7', 'text', '/subjects/7/files/12', '2025-03-13 10:00:00', 7),

-- [3] 추가 답안 파일 (user_id 4)
('운영체제_기말_정답.txt', '정답 내용 예시 8', 'text', '/subjects/8/files/13', '2025-03-13 10:00:00', 8),

-- [3] 추가 답안 파일 (user_id 5)
('데이터베이스_기말_정답.txt', '정답 내용 예시 9', 'text', '/subjects/9/files/14', '2025-03-13 10:00:00', 9);


-- [4] 챗봇 히스토리 (ChatBotHistory) 5개
INSERT INTO chat_bot_history (chat_bot_history_id, history_first_question, history_created_at, user_id) VALUES
(1, '자료구조 핵심 개념 정리해줘', '2025-06-01 10:00:00', 1),
(2, '네트워크 3계층 다시 설명해줄래?', '2025-06-02 14:30:00', 2),
(3, '운영체제 프로세스/스레드 차이 정리', '2025-06-03 09:45:00', 3),
(4, '데이터베이스 정규화 요약해줘', '2025-06-04 16:20:00', 4),
(5, '알고리즘 시간 복잡도 정리해줘', '2025-06-05 11:10:00', 5);

-- [5] 챗봇 메시지 (ChatBotMessages) 10개
INSERT INTO chat_bot_messages (bot_message_id, message_type, message_content, message_created_at, subject_name, file_name, file_url, chat_bot_history_id) VALUES
(1, 'HUMAN', '자료구조 핵심 개념 알려줘.', '2025-06-01 10:00:10', '자료구조', NULL, NULL, 1),
(2, 'AI', '자료구조는 트리와 그래프가 핵심입니다. 자세한 요약을 보여드릴까요?', '2025-06-01 10:00:15', '자료구조', '자료구조_핵심_요약.pdf', '/files/structure_summary.pdf', 1),

(3, 'HUMAN', '네트워크 3계층 다시 설명해줘.', '2025-06-02 14:30:10', '네트워크', NULL, NULL, 2),
(4, 'AI', '네트워크 3계층은 전송계층, 네트워크계층, 데이터링크계층입니다.', '2025-06-02 14:30:15', '네트워크', '네트워크_3계층.pdf', '/files/network_layers.pdf', 2),

(5, 'HUMAN', '운영체제 프로세스와 스레드 차이 뭐야?', '2025-06-03 09:45:10', '운영체제', NULL, NULL, 3),
(6, 'AI', '프로세스는 자원을 독립적으로 가지며, 스레드는 프로세스 내에서 자원을 공유합니다.', '2025-06-03 09:45:15', '운영체제', '프로세스_스레드_비교.pdf', '/files/process_thread.pdf', 3),

(7, 'HUMAN', 'DB 정규화 요약 부탁해.', '2025-06-04 16:20:10', '데이터베이스', NULL, NULL, 4),
(8, 'AI', '정규화는 데이터 중복을 줄이고 무결성을 높이기 위한 설계 방식입니다.', '2025-06-04 16:20:15', '데이터베이스', '정규화_요약.pdf', '/files/db_normalization.pdf', 4),

(9, 'HUMAN', '시간 복잡도 빠르게 설명해줘.', '2025-06-05 11:10:10', '알고리즘', NULL, NULL, 5),
(10, 'AI', '시간 복잡도는 입력 크기에 따른 실행 시간의 증가율을 나타냅니다. Big-O 표기법을 사용합니다.', '2025-06-05 11:10:15', '알고리즘', '시간복잡도_정리.pdf', '/files/time_complexity.pdf', 5);

-- [6] 시험 일정 5개 (날짜만 입력)
INSERT INTO exam_schedule (exam_schedule_date, exam_schedule_name, subject_id, user_id) VALUES
('2025-04-13', '자료구조 중간고사', 1, 1),
('2025-06-15', '자료구조 기말고사', 1, 1),
('2025-06-16', '알고리즘 기말고사', 2, 2),
('2025-06-17', '네트워크 기말고사', 3, 3),
('2025-06-18', '운영체제 기말고사', 4, 4),
('2025-06-19', '데이터베이스 기말고사', 5, 5);

-- [7] 학습 일정 5개 (날짜만 입력, study_schedule_completed 상태 유지)
-- INSERT INTO study_schedule (study_schedule_date, study_schedule_completed, study_schedule_created_at, user_id, file_id, subject_id) VALUES
-- ('2025-06-10', 'COMP', NOW(), 1, 1, 1),
-- ('2025-06-11', 'COMP', NOW(), 1, 1, 1),
-- (NOW(), 'COMP', NOW(), 1, 1, 1),
-- (NOW(), 'UNCOMP', NOW(), 1, 2, 1),
-- (NOW(), 'UNCOMP', NOW(), 1, 4, 3),
-- (NOW(), 'UNCOMP', NOW(), 1, 1, 4),
-- (NOW() - INTERVAL 1 DAY, 'COMP', NOW(), 1, 3, 1), -- 하루 전날
-- ('2025-06-11', 'COMP', NOW(), 2, 2, 2),
-- ('2025-06-12', 'COMP', NOW(), 3, 3, 3),
-- ('2025-06-13', 'COMP', NOW(), 4, 4, 4),
-- ('2025-06-14', 'COMP', NOW(), 5, 5, 5);


-- [7] 학습 일정 10개 (날짜만 입력, study_schedule_completed 상태 유지)
-- [7] 학습 일정 (COMP 3개, UNCOMP 1개)
INSERT INTO study_schedule ( study_schedule_date, study_schedule_completed, study_schedule_created_at, user_id, file_id, subject_id) VALUES
('2025-06-10', 'COMP', NOW(), 1, 1, 1),
('2025-06-10', 'COMP', NOW(), 1, 2, 1),
('2025-06-10', 'COMP', NOW(), 1, 3, 2),
('2025-06-10', 'UNCOMP', NOW(), 1, 4, 2),
-- 테스트 더미 끝
('2025-06-12', 'UNCOMP', NOW(), 1, 2, 1),
('2025-06-12', 'UNCOMP', NOW(), 1, 3, 2),
('2025-06-13', 'UNCOMP', NOW(), 1, 4, 2),
('2025-06-14', 'UNCOMP', NOW(), 1, 5, 3),
('2025-06-15', 'UNCOMP', NOW(), 1, 6, 3),
('2025-06-16', 'UNCOMP', NOW(), 1, 7, 4),
('2025-06-17', 'UNCOMP', NOW(), 1, 8, 4),
('2025-06-18', 'UNCOMP', NOW(), 1, 9, 5),
('2025-06-19', 'UNCOMP', NOW(), 1, 10, 5);

-- [8] 학습 기록 (file_id 1~3 각각 3회차, schedule_id 1~3)
INSERT INTO studys (studys_id, studys_stt_content, studys_feed_content, studys_subject_name, studys_created_at, studys_round, study_schedule_id, file_id) VALUES
-- file_id 1 (자료구조_스택)
(1, '스택 학습 음성 인식 - 1회차', '잘 이해됨', '자료구조', NOW(), 1, 1, 1),
(2, '스택 학습 음성 인식 - 2회차', '복습으로 더 명확해짐', '자료구조', NOW(), 2, 1, 1),
(3, '스택 학습 음성 인식 - 3회차', '개념 완전 정착됨', '자료구조', NOW(), 3, 1, 1),

-- file_id 2 (자료구조_큐)
(4, '큐 학습 음성 인식 - 1회차', '큐 개념 잡힘', '자료구조', NOW(), 1, 2, 2),
(5, '큐 학습 음성 인식 - 2회차', '코드로 구현함', '자료구조', NOW(), 2, 2, 2),
(6, '큐 학습 음성 인식 - 3회차', '문제 풀며 숙련됨', '자료구조', NOW(), 3, 2, 2),

-- file_id 3 (알고리즘_정렬)
(7, '정렬 학습 음성 인식 - 1회차', '버블/삽입 구분 가능', '알고리즘', NOW(), 1, 3, 3),
(8, '정렬 학습 음성 인식 - 2회차', '시간복잡도 이해함', '알고리즘', NOW(), 2, 3, 3),
(9, '정렬 학습 음성 인식 - 3회차', '퀵정렬도 구현함', '알고리즘', NOW(), 3, 3, 3);


-- [9] 학습 메시지 (각 studys_id 별 2개씩)
INSERT INTO study_messages (sm_id, message_type, sm_content, sm_subject_name, sm_file_name, sm_file_url, sm_created_at, studys_id) VALUES
-- studys_id 1~3 (file_id 1, 스택)
(1, 'AI', '스택 개념부터 확인해볼게요.', '자료구조', '자료구조_스택.txt', '/subjects/1/files/1', NOW(), 1),
(2, 'HUMAN', '후입선출 방식이죠!', '자료구조', '자료구조_스택.txt', '/subjects/1/files/1', NOW(), 1),
(3, 'AI', '스택 응용 문제로 넘어가요.', '자료구조', '자료구조_스택.txt', '/subjects/1/files/1', NOW(), 2),
(4, 'HUMAN', '괄호 검사 문제 해봤어요.', '자료구조', '자료구조_스택.txt', '/subjects/1/files/1', NOW(), 2),
(5, 'AI', '스택으로 DFS도 구현 가능해요.', '자료구조', '자료구조_스택.txt', '/subjects/1/files/1', NOW(), 3),
(6, 'HUMAN', '거기까지도 이제 익숙해졌어요.', '자료구조', '자료구조_스택.txt', '/subjects/1/files/1', NOW(), 3),

-- studys_id 4~6 (file_id 2, 큐)
(7, 'AI', '큐 개념도 한번 체크해요.', '자료구조', '자료구조_큐.txt', '/subjects/1/files/2', NOW(), 4),
(8, 'HUMAN', '선입선출 방식!', '자료구조', '자료구조_큐.txt', '/subjects/1/files/2', NOW(), 4),
(9, 'AI', '원형 큐도 알아볼까요?', '자료구조', '자료구조_큐.txt', '/subjects/1/files/2', NOW(), 5),
(10, 'HUMAN', '어렵지만 재밌어요.', '자료구조', '자료구조_큐.txt', '/subjects/1/files/2', NOW(), 5),
(11, 'AI', '실제 문제 적용해봅시다.', '자료구조', '자료구조_큐.txt', '/subjects/1/files/2', NOW(), 6),
(12, 'HUMAN', '이제는 익숙해졌어요.', '자료구조', '자료구조_큐.txt', '/subjects/1/files/2', NOW(), 6),

-- studys_id 7~9 (file_id 3, 정렬)
(13, 'AI', '정렬 알고리즘을 비교해보죠.', '알고리즘', '알고리즘_정렬.txt', '/subjects/2/files/3', NOW(), 7),
(14, 'HUMAN', '버블과 삽입 구분 가능해요.', '알고리즘', '알고리즘_정렬.txt', '/subjects/2/files/3', NOW(), 7),
(15, 'AI', '퀵정렬을 구현해볼게요.', '알고리즘', '알고리즘_정렬.txt', '/subjects/2/files/3', NOW(), 8),
(16, 'HUMAN', '분할 정복 방식이군요.', '알고리즘', '알고리즘_정렬.txt', '/subjects/2/files/3', NOW(), 8),
(17, 'AI', '정렬 성능 비교해봅시다.', '알고리즘', '알고리즘_정렬.txt', '/subjects/2/files/3', NOW(), 9),
(18, 'HUMAN', '시간 복잡도 이해했어요.', '알고리즘', '알고리즘_정렬.txt', '/subjects/2/files/3', NOW(), 9);

-- ✅ 조회
SELECT * FROM USER; 
SELECT * FROM study_messages;

SELECT * FROM study_schedule;
