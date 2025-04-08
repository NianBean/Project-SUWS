// pass รอแก้เป็น hash แล้วเก็บไว้
package handler

import (
	"net/http"
	"users/models"

	"github.com/gin-gonic/gin"
)

// Gen APIKey หลังจากสมัครแล้วเก็บไว้ TEST
// func generateAPIKey() string {
// 	bytes := make([]byte, 16)
// 	rand.Read(bytes)
// 	return hex.EncodeToString(bytes)
// }

func Register(c *gin.Context) {
	var aff = models.Affiliates
	if err := c.ShouldBindJSON(&aff); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err})
		return
	}

	// aff.Affiliate_APIKey = generateAPIKey()

	_, err := models.db.Exec("Insert into affiliates (affiliate_id,affiliate_name,affiliate_email,affiliate_password,affiliate_url, affiliate_api_key) value ($1, $2, $3, $4, $5, $6)", aff.Affiliate_ID, aff.Affiliate_Name, aff.Affiliate_Email, aff.Affiliate_Password, aff.Affiliate_Url, aff.Affiliate_APIKey)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Could not register client"})
		return
	}
	c.JSON(http.StatusOK, gin.H{"message": "Client registered", "api_key": aff.Affiliate_APIKey})

}
