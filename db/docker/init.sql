-- สร้างตาราง courses
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    description TEXT,
    thumbnail_url VARCHAR(255),
    instructor_name VARCHAR(255),
    profile_url VARCHAR(255),
    duration VARCHAR(255),
    price DECIMAL(10,2),
    detail_url VARCHAR(255),
    rating DECIMAL(2,1),
    num_reviews INT,
    enrollment_count INT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- สร้าง function สำหรับอัพเดท updated_at โดยอัตโนมัติ
CREATE OR REPLACE FUNCTION update_modified_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- สร้าง trigger สำหรับอัพเดท updated_at
CREATE TRIGGER update_users_modtime
    BEFORE UPDATE ON users
    FOR EACH ROW
    EXECUTE FUNCTION update_modified_column();


CREATE TABLE affiliates (
    affiliate_id SERIAL PRIMARY KEY,
    affiliate_name VARCHAR(255),
    affiliate_email VARCHAR(255),
    affiliate_password VALUES(255),
    affiliate_url VALUES(255),
    affiliate_api_key VALUES(255)
)

CREATE TABLE request_logs (
    id SERIAL PRIMARY KEY,
    affiliate_id VARCHAR(255),
    action VARCHAR(255),
    parameter TEXT,
    timestamp TIMESTAMP
)

CREATE TABLE Click_logs (
    affiliate_id SERIAL PRIMARY KEY,
    course_id SERIAL ป,
    click_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    clicks INTEGER,
    FOREIGN KEY (affiliate_id) REFERENCES affiliates(id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    
)

-- เพิ่มข้อมูลตัวอย่าง
INSERT INTO courses (
    course_name,
    description,
    thumbnail_url,
    instructor_name,
    profile_url,
    duration,
    price,
    detail_url,
    rating,
    num_reviews,
    enrollment_count
) VALUES (
    'พื้นฐาน JavaScript สำหรับผู้เริ่มต้น',
    'เรียนรู้พื้นฐานของ JavaScript ตั้งแต่ศูนย์ พร้อมแบบฝึกหัดเข้าใจง่าย',
    'https://example.com/images/js-course.jpg',
    'อาจารย์สมชาย ใจดี',
    'https://example.com/instructors/123',
    '3 ชั่วโมง',
    0.00,
    'https://example.com/courses/js-basic',
    4.6,
    7,
    10
),

('Introduction to Programming with Python', 
 'เรียนการเขียนโปรแกรมเบื้องต้นด้วย Python สำหรับผู้เริ่มต้น', 
 'https://example.com/python-thumbnail.jpg', 
 'John Doe', 
 'https://example.com/instructor/john-doe', 
 '10 ชั่วโมง', 
 1500.00, 
 'https://example.com/course/python', 
 4.9, 
 150, 
 1200),
 
('Web Development with JavaScript', 
 'เรียนการพัฒนาเว็บไซต์ด้วย JavaScript สำหรับผู้เริ่มต้นถึงระดับกลาง', 
 'https://example.com/js-thumbnail.jpg', 
 'Jane Smith', 
 'https://example.com/instructor/jane-smith', 
 '8 ชั่วโมง', 
 1350.00, 
 'https://example.com/course/javascript', 
 4.8, 
 220, 
 1500),

('Mastering Java for Web Development', 
 'เรียนการใช้ Java สำหรับพัฒนาเว็บไซต์และแอปพลิเคชันในภาคปฏิบัติ', 
 'https://example.com/java-thumbnail.jpg', 
 'Michael Brown', 
 'https://example.com/instructor/michael-brown', 
 '7 วัน', 
 2000.00, 
 'https://example.com/course/java', 
 4.7, 
 180, 
 1000),

('Data Structures and Algorithms in C++', 
 'คอร์สเรียนโครงสร้างข้อมูลและอัลกอริธึมใน C++ สำหรับนักพัฒนาโปรแกรมขั้นสูง', 
 'https://example.com/cpp-thumbnail.jpg', 
 'Sarah Johnson', 
 'https://example.com/instructor/sarah-johnson', 
 '5 วัน', 
 1850.00, 
 'https://example.com/course/cpp', 
 4.7, 
 130, 
 850);