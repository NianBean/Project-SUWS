package models

type course struct {
	//ID ใช้ int ไม่ใช่หรอ หรือป่าวอ่ะ
	Course_ID         string `json:"-"`
	Course_Name       string `json:"-"`
	Course_Type       string `json:"-"`
	Course_Instructor string `json:"-"`
	Course_Price      int    `json:"-"`
	// ใสเพิ่มอีก
}

// course_id SERIAL PRIMARY KEY,
// course_name VARCHAR(255) NOT NULL,
// description TEXT,
// thumbnail_url VARCHAR(255),
// instructor_name VARCHAR(255),
// profile_url VARCHAR(255),
// duration VARCHAR(255),
// price DECIMAL(10,2),
// detail_url VARCHAR(255),
// rating DECIMAL(2,1),
// num_reviews INT,
// enrollment_count INT,
// created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
// updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
