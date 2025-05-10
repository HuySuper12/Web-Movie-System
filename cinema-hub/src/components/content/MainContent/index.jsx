import { Flex } from "antd";
import Banner from "../../banner";
import ProductListAdmin from "../../product-list-admin";

function MainContent() {
  return (
    <div style={{ flex: 1 }}>
      <Flex vertical gap="2.3rem">
        <Banner />
        <ProductListAdmin />
      </Flex>
    </div>
  );
}

export default MainContent;
