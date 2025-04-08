package models

// รวม request GET ต่างๆ

type Click_logs {
	Affiliate_ID string `json:"affiliate_id"`
	Course_ID string `json:"course_id"`
	Date string `json:"click_date"`
	Clicks int `json:"clicks"`
}

// log การ request

type RequestLog struct {
	AffiliateID string `json:"affiliate_id"`
	Action      string `json:"action"`
	Parameter   string `json:"parameter"`
	Timestamp   string `json:"timestamp"`
}
