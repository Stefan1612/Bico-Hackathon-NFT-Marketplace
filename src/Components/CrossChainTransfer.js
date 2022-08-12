import React from "react";
import {
  Typography,
  Box,
  Button,
  Paper,
  Grid,
  Container,
  Input,
} from "@mui/material";
import Footer from "./Footer";
import ArrowUpwardIcon from "@mui/icons-material/ArrowUpward";
const CrossChainTransfer = () => {
  return (
    <Box
      id="background"
      sx={{ backgroundColor: "#212121", minHeight: "100vh" }}
    >
      <Box
        sx={{
          color: "white",
          paddingLeft: "5px",
        }}
      >
        <ArrowUpwardIcon sx={{ fontSize: 60 }} />
        Check our Services!
      </Box>
      <Box sx={{ color: "white" }}>
        <Typography paddingTop={"15vh"} sx={{ textAlign: "center" }}>
          Cross Chain Transfer
        </Typography>
      </Box>
      <Container>
        <Box paddingTop={"5vh"} marginBottom={"5vh"}>
          <Box id="pages" paddingBottom={"10vh"}>
            <form className="form-inline text-center">
              <i className="fas fa-cat"></i>
            </form>
            <Typography
              Component={"h2"}
              variant={"h1"}
              align="center"
              color={"secondary"}
            >
              Cross Chain Transfer
            </Typography>

            <br></br>
            <div
              className="col-md-10 offset-md-1 d-flex justify-content-around"
              style={{ marginTop: "6vh" }}
            >
              <Container>
                <Box></Box>
              </Container>
            </div>
          </Box>
        </Box>
        <Footer />
      </Container>
    </Box>
  );
};

export default CrossChainTransfer;
