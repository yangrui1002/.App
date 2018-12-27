import java.io.File;
import java.io.IOException;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.web3j.crypto.*;
import org.web3j.utils.Numeric;

class WalletTest {
    private static final Logger log = LoggerFactory.getLogger(WalletTest.class);
    public static void main(String[] args)throws Exception{
        String fileName = WalletUtils.generateNewWalletFile(
                "123456",
                new File ("/.App"),true);
    }
}
