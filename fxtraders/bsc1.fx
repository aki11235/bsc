        // summercamp v0.1
        //hello world


    func Constants(){
            EMA_LENGTH1                      = 120
            EMA_LENGTH2                      = 720
            EMA_LENGTH3                      = 5760

            STD_VAL                          = 1.5

    }

    func Setup() {
            ASignalEma30S                     = EMA30S(`IntervalCount=EMA_LENGTH1`)
            BSignalEma30S                     = EMA30S(`IntervalCount=EMA_LENGTH2`)
            CSignalEma30S                     = EMA30S(`IntervalCount=EMA_LENGTH3`)
            
            EmaStdDev := 0.0
            EmaPlusStdDev := 0.0
            EmaMinusStdDev := 0.0

            KibanaLogger(ASignalEma30S.Value[$], "ema1")
            KibanaLogger(BSignalEma30S.Value[$], "ema2")
            KibanaLogger(CSignalEma30S.Value[$], "ema3")
            KibanaLogger(EmaStdDev, "ema_std")
            KibanaLogger(EmaPlusStdDev, "ema_plus_std")
            KibanaLogger(EmaMinusStdDev, "ema_minus_std")
    }

    func Calculate(){

        EmaStdDev := Std(CSignalEma30S.Value, EMA_LENGTH3)
        EmaPlusStdDev := (EmaStdDev * STD_VAL) + CSignalEma30S.Value[$]
        EmaMinusStdDev := -(EmaStdDev * STD_VAL) + CSignalEma30S.Value[$]

    }

    func BuyNotify(){

    }

    func SellNotify(){

    }

    func WantToBuy() bool{

        if ASignalEma30S.Value[$] > EmaPlusStdDev return true
        


        return false
    }

    func WantToSell() bool{

        if ASignalEma30S.Value[$] < EmaPlusStdDev return true

        return false
    }
