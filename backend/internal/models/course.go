package models

type course struct {
	//ID ใช้ int ไม่ใช่หรอ หรือป่าวอ่ะ
	Course_ID         	string 		`json:"-"`
	Course_Name      	string 		`json:"-"`
	Course_Description      string 		`json:"-"`
	Course_Thumbnail_url  	string 		`json:"-"`
	Course_Profile_url  	string 		`json:"-"`
	Course_Duration  	string 		`json:"-"`
	Course_Price      	float64		`json:"-"`
	Course_Detail_url      	int    		`json:"-"`
	Course_Rating      	float64		`json:"-"`
	Course_Num_reviews     	int    		`json:"-"`
	Course_Enrollment_count int    		`json:"-"`
	Course_Created_at     	time.Time	`json:"created_at" db:"created_at"`
	Course_Updated_at 	time.Time	`json:"updated_at" db:"updated_at"`
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
