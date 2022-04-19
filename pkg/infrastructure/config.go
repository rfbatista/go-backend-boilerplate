package infrastructure

import (
	"github.com/spf13/viper"
)

func NewConfig() (Config, error) {
	var config Config
	viper.SetConfigFile(".env")
	err := viper.ReadInConfig()
	if err != nil {
		return config, err
	}
	viper.Unmarshal(&config)
	return config, nil
}

type Config struct {
	Port int
}
