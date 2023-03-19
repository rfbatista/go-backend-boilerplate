package pkg 

import "go.uber.org/zap"

var Logger *zap.SugaredLogger

func InitializeLogger() {
	LoggerF, _ := zap.NewDevelopment()
	Logger = LoggerF.Sugar()
}
