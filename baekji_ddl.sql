USE baekjidb;

-- [1] 모든 테이블 DROP
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS study_messages;
DROP TABLE IF EXISTS studys;
DROP TABLE IF EXISTS study_schedule;
DROP TABLE IF EXISTS exam_schedule;
DROP TABLE IF EXISTS chat_bot_messages;
DROP TABLE IF EXISTS chat_bot_history;
DROP TABLE IF EXISTS answer_files;
DROP TABLE IF EXISTS subject;
DROP TABLE IF EXISTS user;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE user (
  user_id BIGINT PRIMARY KEY AUTO_INCREMENT,
  user_email VARCHAR(255) NOT NULL,
  user_password TEXT NULL,
  user_role VARCHAR(255) NOT NULL DEFAULT 'USER',
  user_status VARCHAR(255) NOT NULL DEFAULT 'ACTIVE',
  user_name VARCHAR(255) NOT NULL,
  user_created_at DATETIME NOT NULL,
  user_profile_url TEXT NOT NULL,
  user_phone_number VARCHAR(255) NOT NULL,
  user_nickname VARCHAR(255) NOT NULL,
  user_last_logged_in DATETIME NOT NULL DEFAULT '2000-01-01 10:00:00',
  user_studied_days BIGINT NOT NULL DEFAULT 0,
  user_total_studys BIGINT NOT NULL DEFAULT 0,
  user_completed_studys BIGINT NOT NULL DEFAULT 0,
  user_progress_rate DOUBLE NOT NULL DEFAULT 0.0,
  
  CHECK (user_role IN ('USER', 'ADMIN')),
  CHECK (user_status IN ('ACTIVE', 'INACTIVE'))
) ENGINE=InnoDB COMMENT='사용자' CHARACTER SET=utf8mb4;

CREATE TABLE chat_bot_history (
  chat_bot_history_id BIGINT PRIMARY KEY AUTO_INCREMENT,
  history_first_question VARCHAR(255) NULL,
  history_created_at DATETIME NULL,
  user_id BIGINT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES user(user_id)
) ENGINE=InnoDB COMMENT='챗봇 히스토리' CHARACTER SET utf8mb4;

CREATE TABLE chat_bot_messages (
  bot_message_id BIGINT PRIMARY KEY AUTO_INCREMENT,
  message_type VARCHAR(255) NOT NULL,
  message_content TEXT NOT NULL,
  message_created_at DATETIME NOT NULL,
  subject_name VARCHAR(255) NULL,
  file_name VARCHAR(255) NULL,
  file_url TEXT NULL,
  chat_bot_history_id BIGINT NOT NULL,
  FOREIGN KEY (chat_bot_history_id) REFERENCES chat_bot_history(chat_bot_history_id),

  CHECK (message_type IN ('HUMAN', 'AI'))
) ENGINE=InnoDB COMMENT='챗봇 메시지' CHARACTER SET=utf8mb4;


CREATE TABLE subject (
  subject_id BIGINT PRIMARY KEY AUTO_INCREMENT,
  subject_name VARCHAR(255) NOT NULL,
  created_at DATETIME NOT NULL,
  user_id BIGINT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES user(user_id)
) ENGINE=InnoDB COMMENT='과목' CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE answer_files (
  file_id BIGINT PRIMARY KEY AUTO_INCREMENT,
  file_name VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  file_content LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  file_type VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  file_url TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  created_at DATETIME NOT NULL,
  subject_id BIGINT NOT NULL,
  FOREIGN KEY (subject_id) REFERENCES subject(subject_id)
) ENGINE=InnoDB COMMENT='답안 파일' CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE exam_schedule (
  exam_schedule_id BIGINT PRIMARY KEY AUTO_INCREMENT,
  exam_schedule_date DATE NOT NULL,
  exam_schedule_name VARCHAR(255) NOT NULL,
  subject_id BIGINT NOT NULL,
  user_id BIGINT NOT NULL,
  FOREIGN KEY (subject_id) REFERENCES subject(subject_id),
  FOREIGN KEY (user_id) REFERENCES user(user_id)
) ENGINE=InnoDB COMMENT='시험 일정' CHARACTER SET utf8mb4;

CREATE TABLE study_schedule (
  study_schedule_id BIGINT PRIMARY KEY AUTO_INCREMENT,
  study_schedule_date DATE NOT NULL,
  study_schedule_completed VARCHAR(255) NOT NULL,
  study_schedule_created_at DATETIME NOT NULL,
  user_id BIGINT NOT NULL,
  file_id BIGINT NOT NULL,
  subject_id BIGINT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  FOREIGN KEY (file_id) REFERENCES answer_files(file_id),
  FOREIGN KEY (subject_id) REFERENCES subject(subject_id),
  
  CHECK (study_schedule_completed IN ('COMP', 'UNCOMP'))
) ENGINE=InnoDB COMMENT='복습 일정' CHARACTER SET utf8mb4;

CREATE TABLE studys (
  studys_id BIGINT PRIMARY KEY AUTO_INCREMENT,
  studys_stt_content TEXT NOT NULL,
  studys_feed_content TEXT NOT NULL,
  studys_subject_name VARCHAR(255) NULL,
  studys_created_at DATETIME NOT NULL,
  studys_round INT NULL,
  study_schedule_id BIGINT NOT NULL,
  file_id BIGINT NOT NULL,
  FOREIGN KEY (study_schedule_id) REFERENCES study_schedule(study_schedule_id),
  FOREIGN KEY (file_id) REFERENCES answer_files(file_id)
) ENGINE=InnoDB COMMENT='복습 기록' CHARACTER SET utf8mb4;

CREATE TABLE study_messages (
  sm_id BIGINT PRIMARY KEY AUTO_INCREMENT,
  message_type VARCHAR(255) NOT NULL,
  sm_content TEXT NOT NULL,
  sm_subject_name VARCHAR(255) NOT NULL,
  sm_file_name VARCHAR(255) NOT NULL,
  sm_file_url TEXT NOT NULL,
  sm_created_at DATETIME NOT NULL,
  studys_id BIGINT NOT NULL,
  FOREIGN KEY (studys_id) REFERENCES studys(studys_id),
  
  CHECK (message_type IN ('HUMAN', 'AI'))
) ENGINE=InnoDB COMMENT='복습 메시지' CHARACTER SET utf8mb4;

SELECT * FROM USER;
