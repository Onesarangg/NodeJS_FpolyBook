-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2021 at 03:08 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `catalog`
--

CREATE TABLE `catalog` (
  `idCat` int(11) NOT NULL,
  `nameCat` varchar(200) NOT NULL,
  `order` int(11) NOT NULL,
  `showHide` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `catalog`
--

INSERT INTO `catalog` (`idCat`, `nameCat`, `order`, `showHide`) VALUES
(1, 'Lịch sử', 1, 1),
(2, 'Văn học', 2, 0),
(3, 'Nghệ thuật sống', 3, 1),
(4, 'Đời sống ', 4, 1),
(5, 'Thiếu nhi', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `idProduct` int(11) NOT NULL,
  `namePro` varchar(200) NOT NULL,
  `showDes` varchar(300) DEFAULT NULL,
  `images` varchar(200) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `dateUpdate` timestamp NULL DEFAULT NULL,
  `price` double DEFAULT NULL,
  `author` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `idCat` int(11) DEFAULT NULL,
  `showHide` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`idProduct`, `namePro`, `showDes`, `images`, `description`, `dateUpdate`, `price`, `author`, `idCat`, `showHide`) VALUES
(1, 'Sống Chậm Đợi Nắng Lên', 'Sống chậm theo từng nhịp\r\nSống chậm không phải chỉ là ngồi yên đợi thời gian lặng lẽ trôi. Sống chậm là để tĩnh tâm cảm nhận những cung bậc cảm xúc đang hiện hữu trong lòng: buồn bã hay sướng vui, hạnh phúc hay âu lo thắc thỏm… \r\n', 'images/song-cham-doi-nang-len.png', 'Sống chậm từng nhịp còn giúp tôi được rong chơi trong khoảnh vườn xuân bé nhỏ, lắng nghe hơi thở của trăng sao, của lá hoa: “ Đêm ngày đêm buồn bã với những môi hôn / Trong vườn trăng vừa khép những đóa mong manh” như ca từ trong nhạc Trịnh Công Sơn.\r\n\r\nVì sao môi hôn mà lại buồn ? Phải chăng ấy là nỗi buồn của niềm hạnh phúc?\r\n\r\nHoa đang nở trên lưng một cuống lá dài như môi ai đang cười trên lưng một người tình. Nhưng cũng môi hôn đó, vừa cười với trăng hoa dập dìu đã giã từ đêm trăng với những cánh dần khép trong mong manh huyền hoặc…\r\n\r\nVà cứ thế, tôi chầm chậm đến với đóa quỳnh, đến với ngọc lan, đến với chùm hoa giẻ để dịu dàng nở trong tâm mình một đóa bình yên. Tự độ ấy, tôi thành đêm trăng của những ngày xưa với môi hôn quỳnh hương mong manh. Và cũng từ ấy, tôi thấy mình miết mải trôi đi trong dòng trăng trong veo nôn nao cánh buồm cổ tich.\r\n', '2021-01-18 20:57:31', 89000, 'Đỗ Xuân Thảo', 3, 1),
(2, 'Sống Như Lần Đầu, Yêu Như Lần Cuối', 'Cuốn sách là những câu chuyện đời sống hằng ngày, như chuyện của những tấm bưu thiếp, những lá thư tay, những hạnh phúc giản dị mà chúng ta dễ dàng bỏ lỡ, đặc điểm con người, đời sống ở những vùng miền mà tác giả đã đi qua, hay những cảm xúc đang chi phối mỗi người. Từ những trải nghiệm cá nhân, tác', 'images/song-nhu-lan-dau-tien-yeu-thuong-nhu-lan-cuoi.jpg', 'Cuốn sách là những câu chuyện đời sống hằng ngày, như chuyện của những tấm bưu thiếp, những lá thư tay, những hạnh phúc giản dị mà chúng ta dễ dàng bỏ lỡ, đặc điểm con người, đời sống ở những vùng miền mà tác giả đã đi qua, hay những cảm xúc đang chi phối mỗi người. Từ những trải nghiệm cá nhân, tác giả muốn chia sẻ lại những cảm xúc của mình về cách nhìn nhận từ những điều nhỏ nhất, đến những quan điểm về cuộc sống nhân sinh. Qua những trang viết đầy chân thành của một người trẻ, Denley Lupin chuyển tải đến người đọc những thông điệp giá trị để yêu cuộc sống hơn!\r\nCuốn sách có bố cục 4 chương: \r\n+ Kỷ niệm.\r\n+ Hương vị cuộc sống.\r\n+ Tuổi tác.\r\n+ Sống là hạnh phúc.\r\n+TRÍCH ĐOẠN:\r\n- “Cuộc sống là muôn hình vạn trạng, có đẹp có xấu, có hay có dở. Chúng ta sẽ lần lượt được thưởng thức các hương vị ấy trong đời mình. Nếu cuộc sống là một bàn tiệc, thì sẽ có đủ vị cay, đắng, ngọt, bùi, chua và cả những vị kỳ lạ bạn chẳng thể gọi tên. Mỗi người chúng ta gặp, mỗi chuyện chúng ta làm cũng như một màu sắc sẽ góp phần vào bức tranh ghép đang dần được hoàn thiện. Nếu như bạn thử nhìn mọi thứ một cách chậm rãi, trầm tư hơn, bạn sẽ cảm nhận được những điều mà trước kia bạn chưa bao giờ nghĩ tới. Bạn sẽ biết thưởng thức cuộc sống ngay cả từ những điều bạn đã vô tình bỏ qua, từng không mang nhiều ý nghĩa với bạn. Rồi bạn cũng sẽ nhận ra mỗi người có một lý do riêng để sống, theo ý định của bản thân họ. Không một ai giống bạn và bạn cũng sẽ không giống một ai khác”.\r\n- “Nếu được ít nhất một năm một lần, hãy đi đến một nơi mà bạn chưa từng đến trước đây. Sống với cảm giác của một lãng khách, một người lạ, không ai biết đến, rồi rời đi với thêm một dấu ấn. Nếu được hãy đến một nơi mà bạn có thể ngắm bầu trời đêm đầy sao, vì phố phường tấp nập, ánh sáng nhân tạo đã che khuất hết vẻ đẹp của bầu trời đêm đúng nghĩa, lúc đó chỉ có bạn đối diện với khoảng đêm bao la, ắt bạn sẽ nhận ra được nhiều điều ý nghĩa về cuộc sống”.\r\n- “Cho dù một ngày bạn có già đi bao nhiêu, thì đứa trẻ tâm hồn vẫ', '2021-01-18 20:58:04', 99000, 'Denley Lupin', 5, 1),
(3, 'Sống Xanh Như Những Lá Trà', 'Trong cuốn sách thú vị này, bạn sẽ được khám phá kho tàng ý tưởng về sự đơn giản, tiết kiệm, các phương pháp tự chế và cả trí tuệ của người Nhật. Chính Kayaki đã áp dụng điều mà cô gọi là ‘Green tea living’ - gồm ăn thực phẩm ít calo, tập thể dục và thiền định... \r\n', 'images/song-xanh-nhu-nhung-la-tra.png', 'Trong cuốn sách thú vị này, bạn sẽ được khám phá kho tàng ý tưởng về sự đơn giản, tiết kiệm, các phương pháp tự chế và cả trí tuệ của người Nhật. Chính Kayaki đã áp dụng điều mà cô gọi là ‘Green tea living’ - gồm ăn thực phẩm ít calo, tập thể dục và thiền định... vào cuộc sống. Cô cũng đưa ra lời khuyên về việc thường xuyên ăn súp miso, sử dụng phương pháp bấm huyệt, thử dùng dầu ô-liu cho da khô, massage da mặt bằng thìa và các gợi ý để sống cuộc sống thanh đạm.\r\n\r\nTrà xanh không chỉ có lợi cho tim mạch, nó còn có thể được dùng như một loại mỹ phẩm chống lão hóa, như biện pháp ngừa sâu răng và loại bỏ mùi hôi miệng, như công cụ làm sạch, làm phân bón cho cây, và còn là chiến thuật giảm cân (bằng cách uống một cốc trà trước bữa tối). Sống Xanh Như Những Lá Trà của Kayaki quả thật vô cùng hữu ích và sáng tạo cho một cuộc sống thân thiện với môi trường.\r\n', '2021-01-19 00:17:27', 89000, 'Toshimi A. Kayaki', 5, 1),
(4, 'Những Ngày Đầy Nắng', '“Bạn thân mến! Tôi chưa bao giờ nghĩ mình sẽ viết sách. Tôi cũng chưa bao giờ tin, mình có thể làm bánh. Tôi chưa bao giờ biết được rằng, ước mơ lại có giá trị lớn lao đến như vậy, cho đến khi tôi thật sự chạm tay vào… ', 'images/nhung-ngay-day-nang.png', '“Bạn thân mến! Tôi chưa bao giờ nghĩ mình sẽ viết sách. Tôi cũng chưa bao giờ tin, mình có thể làm bánh. Tôi chưa bao giờ biết được rằng, ước mơ lại có giá trị lớn lao đến như vậy, cho đến khi tôi thật sự chạm tay vào… Nếu như hôm đó, trong rất nhiều những thất bại của bản thân, những ngã rẽ, những con đường, rất nhiều những hoạch định tương lai nhưng không có lối đi, hay nơi nào mà mình thật sự thuộc về, nếu tôi bỏ cuộc, chắc chắn, sẽ không có Những ngày đầy nắng, cũng không có tôi của ngày hôm nay. Tôi hiểu cảm giác của sự thất bại, chán chường, nhưng tôi thấm thía hơn rất nhiều về sự kiên nhẫn để đạt được ước mơ, rằng ai cũng có thể làm được điều mình muốn, nếu bạn thật sự muốn, và kiên định với điều đó.\r\n\r\nNhững ngày đầy nắng ra đời, là kết quả của rất nhiều năm tôi tin tưởng và kiên định với con đường mình chọn. Trong quyển sách này, tôi ghi lại công thức, kinh nghiệm và mong muốn được chia sẻ với bạn về tất cả những gì đã trải qua trong căn bếp ấy, với vai trò của một người mẹ, người vợ, chứ không phải là một chuyên gia. Tôi mong bạn, những cô gái, những chàng trai đã trót yêu bếp bánh, yêu cái vị ngọt lành của bơ, đường, trứng, yêu cảm giác bàn tay lấm lem bột, yêu luôn những buổi chiều mưa rả rích và được ôm mình trong căn bếp nhỏ… Tôi mong bạn hãy tin, tin vào chính bạn, rằng bạn hoàn toàn có thể làm được rất nhiều điều kỳ diệu.\r\n\r\nNhững ngày đầy nắng là những ngày dù bên ngoài có như thế nào, dù là giông bão, hay là những bộn bề lo toan đến mệt nhoài, hay những vất vả đời thường của cơm, áo, gạo, tiền đè nặng lên vai… thì chỉ cần bước vào căn bếp nhỏ, được hít hà vị bánh thơm lừng từ chiếc lò cũ kỹ, được thấy đứa con bé bỏng í ới gọi mẹ cho ăn bánh, được sống là mình và rõ ràng đó là chính mình, một cách nguyên bản và không hề mảy may nghi ngờ về bản thân, với tôi, đó thật sự là những ngày đầy nắng…\r\n\r\nTôi chúc bạn, dù ngoài trời có như thế nào thì trong căn nhà nhỏ mà ấm áp, nơi góc bếp xinh đó, bạn sẽ tìm được những yêu thương ngọt ngào cho chính mình…” ', '2021-01-19 00:17:27', 129000, 'Hoàng Yến', 1, 1),
(5, 'Sức Mạnh Của Sự Tử Tế', 'Bạn có nhớ nụ cười của một người lạ khi bạn giữ cửa cho họ bước qua hay lời cảm ơn chân thành từ một người bạn khi được bạn giúp đỡ không? Có phải bạn cảm thấy hạnh phúc đến lạ khi làm được điều gì đó cho người khác, dù việc bạn làm vô cùng nhỏ bé? Nụ cười của họ có thể làm bạn vui cả ngày, và lời c', 'images/suc-manh-cua-su-tu-te.png', 'Bạn có nhớ nụ cười của một người lạ khi bạn giữ cửa cho họ bước qua hay lời cảm ơn chân thành từ một người bạn khi được bạn giúp đỡ không? Có phải bạn cảm thấy hạnh phúc đến lạ khi làm được điều gì đó cho người khác, dù việc bạn làm vô cùng nhỏ bé? Nụ cười của họ có thể làm bạn vui cả ngày, và lời cảm ơn chân thành từ người nhận giúp bạn cảm thấy cuộc sống mình có ý nghĩa hơn. \r\n\r\nĐó chính là sức mạnh từ sự tử tế - những việc làm nhỏ bé nhưng mang đến niềm hạnh phúc to lớn. Chúng ta đang sống trong thời đại mà phần lớn tin tức trên báo đài, ti-vi là tiêu cực, khiến ta băn khoăn tự hỏi có phải đạo đức con người đang ngày càng đi xuống. Nhưng dù thế nào đi nữa, hãy luôn tin rằng ở đâu đó vẫn còn những con người tử tế, sống và làm điều tử tế mỗi ngày. \r\n\r\nSức Mạnh Từ Sự Tử Tế tập hợp những câu chuyện sâu sắc và ý nghĩa về sự tử tế mỗi ngày. Một hành động tử tế nhỏ bé có thể tạo ra sự khác biệt lớn lao cho một ngày, thậm chí là cả cuộc đời, của ai đó. Qua những câu chuyện trong quyển sách nhỏ này, bạn sẽ gặp gỡ những con người bình dị, làm những việc tử tế xuất phát từ trái tim chứ không mong đợi được đền đáp, để rồi sau đó cả cuộc đời của họ lẫn người được họ giúp đỡ đều thay đổi theo hướng tốt đẹp hơn.\r\n\r\nChúng tôi tin rằng quyển sách sẽ là dòng nước mát cuốn trôi những hoài nghi trong bạn vốn cho rằng thế giới này chỉ đầy rẫy những điều xấu xa. Mong rằng sau khi đọc xong quyển sách này, bạn sẽ nở một nụ cười và có thêm động lực làm điều gì đó tử tế cho người khác, dù đó chỉ là một việc nhỏ bé. Như thế cũng đã là niềm vui và vinh dự lớn lao cho những người thực hiện quyển sách này.\r\n', '2021-01-19 00:22:30', 68000, 'Jack Canfield', 2, 1),
(6, 'Để Có Một Tương Lai', 'Trong xã hội có rất nhiều mối nguy. Nếu chúng ta đặt một người trẻ vào xã hội mà không tìm cách bảo vệ họ, họ sẽ tiếp nhận những bạo động, căm thù, sợ hãi và bất an mỗi ngày, rốt cuộc họ sẽ bị bệnh. Những câu chuyện của chúng ta, những chương trình tivi, quảng cáo, sách báo đều tưới tẩm các hạt giốn', 'images/de-co-mot-tuong-lai.png', 'Trong xã hội có rất nhiều mối nguy. Nếu chúng ta đặt một người trẻ vào xã hội mà không tìm cách bảo vệ họ, họ sẽ tiếp nhận những bạo động, căm thù, sợ hãi và bất an mỗi ngày, rốt cuộc họ sẽ bị bệnh. Những câu chuyện của chúng ta, những chương trình tivi, quảng cáo, sách báo đều tưới tẩm các hạt giống khổ đau nơi những người trẻ và cả những người lớn. Chúng ta cần một vài nguyên tắc, vài phương thuốc cho căn bệnh của mình, những gì lành, đẹp và thật để có thể nương tựa vào.\r\n\r\n2.500 năm trước, Bụt đã đưa ra các nguyên tắc cho những người đệ tử tại gia của Ngài để giúp họ sống một đời sống bình an, lành mạnh và hạnh phúc. Đó là Năm Giới và nền tảng của mỗi Giới này là chánh niệm. Với chánh niệm, chúng ta ý thức được những gì đang xảy ra nơi thân thể, cảm thọ, tâm hồn và thế giới quanh ta, cũng như ta tránh không gây tổn hại cho mình và cho người.\r\n\r\nHọc hỏi và thực tập theo Năm Giới và nương tựa Tam Bảo chắc chắn sẽ mang lại an lạc cho bản thân, cho cộng đồng và cho xã hội. Là con người, chúng ta cần có một cái gì để tin tưởng, một cái gì lành, đẹp và thật, một cái gì mà ta có thể tiếp xúc. Trong quyển sách này, Năm Giới được diễn bày theo hình thức mới, đó là Bảo vệ sự sống, Hạnh phúc chân thực, Tình thương đích thực, Ái ngữ và Lắng nghe, Nuôi dưỡng và trị liệu.\r\n\r\nNăm Giới chính là tình thương. Thương có nghĩa là hiểu, bảo vệ và mang lại an vui cho đối tượng thương yêu của chúng ta. Giới không phải là luật lệ mà là những nguyên tắc hướng dẫn giúp ta tập sống như thế nào để có thể bảo hộ cho mình và cho những người xung quanh.\r\n\r\nKhi có người hỏi: “Bạn có quan tâm đến bản thân không?”, “Bạn có quan tâm đến người bạn đời không”, “Bạn có quan tâm đến Trái đất không?”… cách hay nhất để trả lời là hành trì Năm Giới. Đây là cách dạy bằng thân giáo chứ không phải chỉ bằng lời. Nếu bạn thật sự quan tâm, xin hãy hành trì các Giới này để bảo hộ cho mình và cho mọi người, mọi loài khác nữa. Nếu chúng ta thực tập hết lòng thì tương lai sẽ còn có mặt cho chúng ta và con cháu chú', '2021-01-19 00:22:30', 155000, 'Thích Nhất Hạnh', 2, 1),


-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `rule` tinyint(1) NOT NULL,
  `lock` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`idUser`, `Username`, `Password`, `rule`, `lock`) VALUES
(1, 'admin', '123', 1, 0),
(2, 'one', '123', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`idCat`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`idProduct`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `catalog`
--
ALTER TABLE `catalog`
  MODIFY `idCat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `idProduct` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
