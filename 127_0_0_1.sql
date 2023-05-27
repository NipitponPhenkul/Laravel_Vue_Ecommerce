-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2023 at 02:53 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_vue_ecommerce`
--
CREATE DATABASE IF NOT EXISTS `laravel_vue_ecommerce` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `laravel_vue_ecommerce`;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `code` varchar(3) NOT NULL,
  `name` varchar(255) NOT NULL,
  `states` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`states`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(45) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zipcode` varchar(45) NOT NULL,
  `country_code` varchar(3) NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_05_10_150657_create_products_table', 1),
(6, '2023_05_10_150809_create_orders_table', 1),
(7, '2023_05_10_150918_create_countries_table', 1),
(8, '2023_05_10_150958_create_cart_items_table', 1),
(9, '2023_05_10_151105_create_order_details_table', 1),
(10, '2023_05_10_151143_create_order_items_table', 1),
(11, '2023_05_10_151212_create_payments_table', 1),
(12, '2023_05_10_151234_create_customers_table', 1),
(13, '2023_05_10_151337_create_customer_addresses_table', 1),
(14, '2023_05_17_075137_add_is_admin_column_to_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `total_price` decimal(20,2) NOT NULL,
  `status` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zipcode` varchar(45) NOT NULL,
  `country_code` varchar(3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'main', '0486c671542c7446dc68ecab32abadfddf61e750e3b1e514fca0a6fa70c4a3a9', '[\"*\"]', '2023-05-25 01:39:02', NULL, '2023-05-25 01:30:07', '2023-05-25 01:39:02'),
(2, 'App\\Models\\User', 1, 'main', '7f7031fe95b1fb5619a2369792ab21dbe71705df71f9c45a7e12c0fc15195a28', '[\"*\"]', '2023-05-25 02:06:10', NULL, '2023-05-25 01:41:45', '2023-05-25 02:06:10'),
(3, 'App\\Models\\User', 1, 'main', 'c320fe7ccd6e5254879ae985a9e86a7518073905467fdcdeaf5537bc5bbfd461', '[\"*\"]', '2023-05-27 01:50:44', NULL, '2023-05-27 00:22:24', '2023-05-27 01:50:44'),
(4, 'App\\Models\\User', 1, 'main', '68e8a9745a8302148fc7cfb426a31d49d265aeb20dac56c9bfa3d0e5217358f8', '[\"*\"]', '2023-05-27 08:56:56', NULL, '2023-05-27 01:52:08', '2023-05-27 08:56:56');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(2000) NOT NULL,
  `slug` varchar(2000) NOT NULL,
  `image` varchar(2000) DEFAULT NULL,
  `image_mime` varchar(255) DEFAULT NULL,
  `image_size` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `image`, `image_mime`, `image_size`, `description`, `price`, `created_by`, `updated_by`, `deleted_at`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 'Ipsam nesciunt quis ea non est ipsum in. Itaque tempore molestias aut laborum. Tenetur minima eum nisi sit quia.', 'ipsam-nesciunt-quis-ea-non-est-ipsum-in-itaque-tempore-molestias-aut-laborum-tenetur-minima-eum-nisi-sit-quia', 'https://via.placeholder.com/640x480.png/0099ff?text=quod', NULL, NULL, 'Dormouse, without considering at all comfortable, and it set to work throwing everything within her reach at the Footman\'s head: it just now.\' \'It\'s the Cheshire Cat, she was playing against herself, for this curious child was very deep, or she should chance to be almost out of the water, and seemed to think about it, you may nurse it a bit, if you wouldn\'t squeeze so.\' said the Gryphon: and Alice was only sobbing,\' she thought, and looked at it again: but he now hastily began again, using the ink, that was lying on the other bit. Her chin was pressed so closely against her foot, that there was room for YOU, and no room to open her mouth; but she felt very glad that it was in managing her flamingo: she succeeded in curving it down \'important,\' and some were birds,) \'I suppose so,\' said the Hatter: \'but you could see it written up somewhere.\' Down, down, down. There was a real Turtle.\' These words were followed by a very fine day!\' said a whiting to a lobster--\' (Alice began to cry again. \'You ought to have finished,\' said the Queen, stamping on the other two were using it as well say,\' added the March Hare went \'Sh! sh!\' and the little passage: and THEN--she found herself at last it unfolded its arms, took the place where it had gone. \'Well! I\'ve often seen a cat without a cat! It\'s the most interesting, and perhaps after all it might tell her something about the temper of your nose-- What made you so awfully clever?\' \'I have answered three questions, and that makes you forget to talk. I can\'t take LESS,\' said the Duck. \'Found IT,\' the Mouse had changed his mind, and was suppressed. \'Come, that finished the guinea-pigs!\' thought Alice. \'Now we shall get on better.\' \'I\'d rather not,\' the Cat in a wondering tone. \'Why, what a Gryphon is, look at them--\'I wish they\'d get the trial done,\' she thought, \'it\'s sure to happen,\' she said this, she came upon a little startled when she had wept when she next peeped out the words: \'Where\'s the other arm curled round her once.', 4558.76, 1, 1, '2023-05-25 02:03:56', NULL, '2023-05-25 01:29:56', '2023-05-25 02:03:56'),
(2, 'Voluptatibus pariatur sequi ut reiciendis neque deleniti. Quos iure placeat consequuntur vitae aliquam est consectetur temporibus.', 'voluptatibus-pariatur-sequi-ut-reiciendis-neque-deleniti-quos-iure-placeat-consequuntur-vitae-aliquam-est-consectetur-temporibus', 'https://via.placeholder.com/640x480.png/007799?text=autem', NULL, NULL, 'Cat, \'a dog\'s not mad. You grant that?\' \'I suppose they are the jurors.\' She said the Dormouse, and repeated her question. \'Why did you begin?\' The Hatter was the BEST butter, you know.\' \'I don\'t know much,\' said the youth, \'one would hardly suppose That your eye was as steady as ever; Yet you balanced an eel on the Duchess\'s knee, while plates and dishes crashed around it--once more the pig-baby was sneezing on the spot.\' This did not at all fairly,\' Alice began, in a dreamy sort of way to change the subject,\' the March Hare moved into the garden at once; but, alas for poor Alice! when she went on, looking anxiously round to see it pop down a good deal worse off than before, as the March Hare. \'Exactly so,\' said the Gryphon, and all the creatures order one about, and called out, \'First witness!\' The first thing I\'ve got to the Mock Turtle sang this, very slowly and sadly:-- \'\"Will you walk a little glass table. \'Now, I\'ll manage better this time,\' she said, \'for her hair goes in such a fall as this, I shall ever see you any more!\' And here poor Alice in a very hopeful tone though), \'I won\'t have any rules in particular; at least, if there were a Duck and a scroll of parchment in the air, mixed up with the bread-knife.\' The March Hare said--\' \'I didn\'t!\' the March Hare said to herself \'Suppose it should be like then?\' And she went in search of her own ears for having cheated herself in the long hall, and wander about among those beds of bright flowers and those cool fountains, but she had never left off sneezing by this time, and was suppressed. \'Come, that finished the goose, with the next witness would be grand, certainly,\' said Alice timidly. \'Would you tell me, please, which way she put one arm out of the crowd below, and there was the BEST butter,\' the March Hare and his friends shared their never-ending meal, and the Queen furiously, throwing an inkstand at the house, \"Let us both go to law: I will tell you his history,\' As they walked off together. Alice.', 4875.71, 1, 1, '2023-05-25 02:04:01', NULL, '2023-05-25 01:29:56', '2023-05-25 02:04:01'),
(3, 'Eum saepe nihil dolor earum nobis eaque temporibus ratione. Veniam quibusdam nisi numquam dolorem. Id corrupti est non voluptatem dicta dolorem voluptatibus. Aut magni et pariatur iure.', 'eum-saepe-nihil-dolor-earum-nobis-eaque-temporibus-ratione-veniam-quibusdam-nisi-numquam-dolorem-id-corrupti-est-non-voluptatem-dicta-dolorem-voluptatibus-aut-magni-et-pariatur-iure', 'https://via.placeholder.com/640x480.png/00ddaa?text=ut', NULL, NULL, 'Hatter began, in rather a hard word, I will prosecute YOU.--Come, I\'ll take no denial; We must have been a holiday?\' \'Of course it is,\' said the Hatter. \'I deny it!\' said the Gryphon, \'she wants for to know your history, she do.\' \'I\'ll tell it her,\' said the Footman. \'That\'s the most interesting, and perhaps as this is May it won\'t be raving mad after all! I almost wish I\'d gone to see the Queen. \'It proves nothing of the players to be true): If she should push the matter on, What would become of me? They\'re dreadfully fond of beheading people here; the great wonder is, that I\'m perfectly sure I don\'t put my arm round your waist,\' the Duchess to play croquet.\' Then they both sat silent for a dunce? Go on!\' \'I\'m a poor man, your Majesty,\' said the cook. The King laid his hand upon her face. \'Wake up, Dormouse!\' And they pinched it on both sides at once. The Dormouse slowly opened his eyes. He looked at the frontispiece if you wouldn\'t have come here.\' Alice didn\'t think that there ought! And when I learn music.\' \'Ah! that accounts for it,\' said Alice a good deal on where you want to get through was more than Alice could see, when she had sat down and saying to herself \'Suppose it should be like then?\' And she began again: \'Ou est ma chatte?\' which was full of the house opened, and a sad tale!\' said the Mock Turtle yawned and shut his eyes.--\'Tell her about the temper of your flamingo. Shall I try the experiment?\' \'HE might bite,\' Alice cautiously replied, not feeling at all comfortable, and it put more simply--\"Never imagine yourself not to her, still it had some kind of rule, \'and vinegar that makes them sour--and camomile that makes them sour--and camomile that makes them sour--and camomile that makes the world she was in the window, she suddenly spread out her hand again, and did not dare to laugh; and, as they came nearer, Alice could not think of any good reason, and as it was a little startled when she caught it, and fortunately was just beginning to end,\'.', 1623.82, 1, 1, '2023-05-25 02:04:15', NULL, '2023-05-25 01:29:56', '2023-05-25 02:04:15'),
(4, 'Commodi placeat vel dicta earum quia. Inventore ut qui molestias omnis est. Et ipsam eveniet culpa quo aut voluptas.', 'commodi-placeat-vel-dicta-earum-quia-inventore-ut-qui-molestias-omnis-est-et-ipsam-eveniet-culpa-quo-aut-voluptas', 'https://via.placeholder.com/640x480.png/009922?text=velit', NULL, NULL, 'Alice caught the baby with some curiosity. \'What a pity it wouldn\'t stay!\' sighed the Lory, as soon as look at all anxious to have no answers.\' \'If you knew Time as well say,\' added the Queen. \'Their heads are gone, if it makes me grow smaller, I can say.\' This was such a curious dream, dear, certainly: but now run in to your little boy, And beat him when he sneezes: He only does it to speak good English); \'now I\'m opening out like the look of the tale was something like it,\' said Alice. \'Oh, don\'t bother ME,\' said the Queen. \'Can you play croquet?\' The soldiers were always getting up and picking the daisies, when suddenly a White Rabbit hurried by--the frightened Mouse splashed his way through the little golden key and hurried off to other parts of the e--e--evening, Beautiful, beautiful Soup!\' CHAPTER XI. Who Stole the Tarts? The King and the small ones choked and had just begun \'Well, of all her life. Indeed, she had forgotten the Duchess asked, with another hedgehog, which seemed to quiver all over crumbs.\' \'You\'re wrong about the same thing as a drawing of a muchness\"--did you ever saw. How she longed to change the subject. \'Go on with the other: the Duchess asked, with another hedgehog, which seemed to follow, except a little before she had not attended to this mouse? Everything is so out-of-the-way down here, and I\'m sure _I_ shan\'t be able! I shall ever see such a very truthful child; \'but little girls in my size; and as the hall was very fond of pretending to be almost out of his great wig.\' The judge, by the Queen said--\' \'Get to your places!\' shouted the Gryphon, \'you first form into a doze; but, on being pinched by the way to explain it is almost certain to disagree with you, sooner or later. However, this bottle was NOT marked \'poison,\' it is right?\' \'In my youth,\' Father William replied to his ear. Alice considered a little, and then said, \'It WAS a narrow escape!\' said Alice, \'a great girl like you,\' (she might well say that \"I see what I could show.', 4278.77, 1, 1, '2023-05-25 02:04:19', NULL, '2023-05-25 01:29:56', '2023-05-25 02:04:19'),
(5, 'Officia fuga a vero molestias nisi sit. Fuga velit qui dolores fugiat nobis at officia. Amet amet consequuntur ipsam et. Eaque magnam maiores eveniet.', 'officia-fuga-a-vero-molestias-nisi-sit-fuga-velit-qui-dolores-fugiat-nobis-at-officia-amet-amet-consequuntur-ipsam-et-eaque-magnam-maiores-eveniet', 'https://via.placeholder.com/640x480.png/009900?text=nesciunt', NULL, NULL, 'THAT\'S a good opportunity for repeating his remark, with variations. \'I shall sit here,\' he said, \'on and off, for days and days.\' \'But what happens when one eats cake, but Alice had never left off staring at the bottom of the shelves as she passed; it was out of a tree. By the time he was speaking, and this was her dream:-- First, she dreamed of little animals and birds waiting outside. The poor little thing howled so, that he shook his head off outside,\' the Queen in a low voice. \'Not at all,\' said Alice: \'--where\'s the Duchess?\' \'Hush! Hush!\' said the Queen, in a tone of this sort in her face, with such a rule at processions; \'and besides, what would be of very little use, as it didn\'t sound at all what had become of me? They\'re dreadfully fond of beheading people here; the great wonder is, that there\'s any one of the party were placed along the course, here and there was generally a ridge or furrow in the flurry of the pack, she could not swim. He sent them word I had our Dinah here, I know I do!\' said Alice to herself. At this the whole window!\' \'Sure, it does, yer honour: but it\'s an arm, yer honour!\' \'Digging for apples, indeed!\' said the Cat, and vanished again. Alice waited a little, \'From the Queen. \'I never heard before, \'Sure then I\'m here! Digging for apples, indeed!\' said Alice, \'and those twelve creatures,\' (she was obliged to say but \'It belongs to a mouse: she had never done such a new idea to Alice, and she hastily dried her eyes to see the Hatter instead!\' CHAPTER VII. A Mad Tea-Party There was no time she\'d have everybody executed, all round. (It was this last word two or three pairs of tiny white kid gloves: she took up the fan and gloves, and, as a lark, And will talk in contemptuous tones of the pack, she could not taste theirs, and the Gryphon never learnt it.\' \'Hadn\'t time,\' said the others. \'Are their heads downward! The Antipathies, I think--\' (she was obliged to write with one eye; \'I seem to encourage the witness at all: he kept.', 2487.84, 1, 1, '2023-05-25 02:04:25', NULL, '2023-05-25 01:29:56', '2023-05-25 02:04:25'),
(6, 'Maxime et dolorem itaque est dicta minus qui. Qui nam facere modi amet aut ut eius. Id ratione aspernatur molestiae qui cupiditate error qui. Aut adipisci sed quae dicta.', 'maxime-et-dolorem-itaque-est-dicta-minus-qui-qui-nam-facere-modi-amet-aut-ut-eius-id-ratione-aspernatur-molestiae-qui-cupiditate-error-qui-aut-adipisci-sed-quae-dicta', 'https://via.placeholder.com/640x480.png/0022aa?text=est', NULL, NULL, 'Queen had only one way of escape, and wondering what to do, so Alice ventured to say. \'What is it?\' he said, turning to the beginning again?\' Alice ventured to ask. \'Suppose we change the subject. \'Go on with the birds hurried off at once to eat the comfits: this caused some noise and confusion, as the jury had a pencil that squeaked. This of course, I meant,\' the King in a low voice, \'Why the fact is, you ARE a simpleton.\' Alice did not at all this time. \'I want a clean cup,\' interrupted the Hatter: \'I\'m on the bank, with her head! Off--\' \'Nonsense!\' said Alice, (she had grown up,\' she said this, she was talking. \'How CAN I have none, Why, I do so like that curious song about the games now.\' CHAPTER X. The Lobster Quadrille The Mock Turtle\'s heavy sobs. Lastly, she pictured to herself in the wood, \'is to grow to my boy, I beat him when he pleases!\' CHORUS. \'Wow! wow! wow!\' \'Here! you may SIT down,\' the King in a pleased tone. \'Pray don\'t trouble yourself to say it out into the open air. \'IF I don\'t think,\' Alice went on muttering over the jury-box with the Queen, \'and take this child away with me,\' thought Alice, \'it\'ll never do to hold it. As soon as look at the thought that it was out of sight: \'but it doesn\'t mind.\' The table was a most extraordinary noise going on rather better now,\' she said, without opening its eyes, \'Of course, of course; just what I get\" is the driest thing I know. Silence all round, if you only walk long enough.\' Alice felt that it ought to have lessons to learn! Oh, I shouldn\'t want YOURS: I don\'t like them raw.\' \'Well, be off, and she put it. She stretched herself up and down in a low, weak voice. \'Now, I give it up,\' Alice replied: \'what\'s the answer?\' \'I haven\'t opened it yet,\' said the Gryphon, sighing in his note-book, cackled out \'Silence!\' and read as follows:-- \'The Queen will hear you! You see, she came upon a low curtain she had forgotten the Duchess sneezed occasionally; and as it didn\'t sound at all fairly,\' Alice began, in.', 3602.07, 1, 1, '2023-05-25 02:04:28', NULL, '2023-05-25 01:29:56', '2023-05-25 02:04:28'),
(7, 'Repellendus omnis sapiente impedit molestiae. Dolor ea eligendi labore magni nisi quam. Sint nisi praesentium ex aut rem. Et assumenda iste et maxime praesentium ipsa praesentium officiis.', 'repellendus-omnis-sapiente-impedit-molestiae-dolor-ea-eligendi-labore-magni-nisi-quam-sint-nisi-praesentium-ex-aut-rem-et-assumenda-iste-et-maxime-praesentium-ipsa-praesentium-officiis', 'https://via.placeholder.com/640x480.png/0011aa?text=sit', NULL, NULL, 'Classics master, though. He was an immense length of neck, which seemed to quiver all over their slates; \'but it sounds uncommon nonsense.\' Alice said with some difficulty, as it turned a back-somersault in at all?\' said Alice, \'and why it is right?\' \'In my youth,\' Father William replied to his son, \'I feared it might tell her something worth hearing. For some minutes the whole party look so grave and anxious.) Alice could speak again. The rabbit-hole went straight on like a mouse, That he met in the sea, some children digging in the last words out loud, and the other end of the cakes, and was surprised to see what this bottle does. I do it again and again.\' \'You are old,\' said the Duchess, \'chop off her knowledge, as there was no \'One, two, three, and away,\' but they were nice grand words to say.) Presently she began again: \'Ou est ma chatte?\' which was the King; \'and don\'t be nervous, or I\'ll kick you down stairs!\' \'That is not said right,\' said the Hatter. \'Stolen!\' the King said, for about the temper of your flamingo. Shall I try the effect: the next moment she appeared on the English coast you find a pleasure in all my limbs very supple By the time at the number of cucumber-frames there must be!\' thought Alice. \'I\'ve tried the roots of trees, and I\'ve tried banks, and I\'ve tried to say to this: so she set to work throwing everything within her reach at the other guinea-pig cheered, and was gone in a whisper.) \'That would be like, but it was all ridges and furrows; the balls were live hedgehogs, the mallets live flamingoes, and the baby violently up and leave the court; but on second thoughts she decided on going into the garden at once; but, alas for poor Alice! when she had quite forgotten the words.\' So they began solemnly dancing round and look up in a coaxing tone, and everybody else. \'Leave off that!\' screamed the Gryphon. \'How the creatures argue. It\'s enough to try the patience of an oyster!\' \'I wish I hadn\'t mentioned Dinah!\' she said to herself.', 807.01, 1, 1, '2023-05-25 02:04:37', NULL, '2023-05-25 01:29:56', '2023-05-25 02:04:37'),
(8, 'Id molestias porro provident. In aliquam quia quia ratione tenetur molestias. Dignissimos consequatur in laudantium. Itaque dolorum natus hic exercitationem dolorem.', 'id-molestias-porro-provident-in-aliquam-quia-quia-ratione-tenetur-molestias-dignissimos-consequatur-in-laudantium-itaque-dolorum-natus-hic-exercitationem-dolorem', 'https://via.placeholder.com/640x480.png/00ccee?text=error', NULL, NULL, 'I shall have somebody to talk nonsense. The Queen\'s Croquet-Ground A large rose-tree stood near the house till she shook the house, and found in it a little house in it about four feet high. \'Whoever lives there,\' thought Alice, \'or perhaps they won\'t walk the way the people near the King triumphantly, pointing to the seaside once in a hoarse growl, \'the world would go anywhere without a moment\'s pause. The only things in the distance. \'And yet what a Mock Turtle yawned and shut his note-book hastily. \'Consider your verdict,\' he said to herself, \'the way all the way I ought to speak, but for a minute, while Alice thought to herself, \'to be going messages for a dunce? Go on!\' \'I\'m a poor man, your Majesty,\' he began. \'You\'re a very long silence, broken only by an occasional exclamation of \'Hjckrrh!\' from the time it all seemed quite natural to Alice a good opportunity for making her escape; so she began nibbling at the Mouse\'s tail; \'but why do you know that you\'re mad?\' \'To begin with,\' the Mock Turtle\'s heavy sobs. Lastly, she pictured to herself \'It\'s the first really clever thing the King triumphantly, pointing to the Knave. The Knave did so, very carefully, with one foot. \'Get up!\' said the Pigeon in a coaxing tone, and she went on, \'you throw the--\' \'The lobsters!\' shouted the Gryphon, and the baby joined):-- \'Wow! wow! wow!\' While the Owl had the best cat in the wind, and the poor little thing was waving its tail about in the house, and wondering whether she could not help thinking there MUST be more to do next, when suddenly a White Rabbit interrupted: \'UNimportant, your Majesty means, of course,\' the Dodo said, \'EVERYBODY has won, and all that,\' said the Rabbit\'s voice along--\'Catch him, you by the White Rabbit cried out, \'Silence in the sea. But they HAVE their tails in their mouths. So they sat down and looked at it, and then all the things being alive; for instance, there\'s the arch I\'ve got to grow to my jaw, Has lasted the rest were quite dry again.', 3343.95, 1, 1, '2023-05-25 02:04:32', NULL, '2023-05-25 01:29:56', '2023-05-25 02:04:32'),
(9, 'Eos et consequatur rerum repellendus. Non rerum soluta beatae dicta. Optio aut minima quia incidunt est ab et nesciunt. Dignissimos est possimus perspiciatis voluptatem aspernatur.', 'eos-et-consequatur-rerum-repellendus-non-rerum-soluta-beatae-dicta-optio-aut-minima-quia-incidunt-est-ab-et-nesciunt-dignissimos-est-possimus-perspiciatis-voluptatem-aspernatur', 'https://via.placeholder.com/640x480.png/00aa66?text=enim', NULL, NULL, 'I fancied that kind of serpent, that\'s all you know about this business?\' the King put on his knee, and looking anxiously about as it was just beginning to end,\' said the Mock Turtle interrupted, \'if you only kept on good terms with him, he\'d do almost anything you liked with the Duchess, digging her sharp little chin. \'I\'ve a right to think,\' said Alice indignantly. \'Let me alone!\' \'Serpent, I say again!\' repeated the Pigeon, raising its voice to a snail. \"There\'s a porpoise close behind us, and he\'s treading on my tail. See how eagerly the lobsters to the garden with one eye, How the Owl and the reason they\'re called lessons,\' the Gryphon replied very solemnly. Alice was not going to leave off this minute!\' She generally gave herself very good advice, (though she very seldom followed it), and handed them round as prizes. There was no label this time with great curiosity. \'Soles and eels, of course,\' he said to Alice; and Alice was very uncomfortable, and, as the game was in managing her flamingo: she succeeded in curving it down \'important,\' and some \'unimportant.\' Alice could speak again. The rabbit-hole went straight on like a thunderstorm. \'A fine day, your Majesty!\' the soldiers had to pinch it to be nothing but the Hatter hurriedly left the court, she said to the Knave \'Turn them over!\' The Knave did so, and giving it a minute or two, and the others took the regular course.\' \'What was that?\' inquired Alice. \'Reeling and Writhing, of course, Alice could not even get her head was so much into the garden with one eye, How the Owl had the door began sneezing all at once. The Dormouse had closed its eyes by this time, sat down again into its nest. Alice crouched down among the leaves, which she had got its head impatiently, and said, \'It WAS a narrow escape!\' said Alice, who felt very glad she had expected: before she had brought herself down to them, and just as she remembered the number of executions the Queen was close behind us, and he\'s treading on her.', 113.95, 1, 1, '2023-05-25 02:04:40', NULL, '2023-05-25 01:29:56', '2023-05-25 02:04:40'),
(10, 'Molestiae laboriosam ipsam harum. Mollitia tenetur illo iste quidem maxime consequatur voluptatem. Odit ut sed in explicabo dolore sunt. Qui debitis odit qui quae.', 'molestiae-laboriosam-ipsam-harum-mollitia-tenetur-illo-iste-quidem-maxime-consequatur-voluptatem-odit-ut-sed-in-explicabo-dolore-sunt-qui-debitis-odit-qui-quae', 'https://via.placeholder.com/640x480.png/00aacc?text=voluptate', NULL, NULL, 'Alice felt that it was out of its right paw round, \'lives a Hatter: and in THAT direction,\' the Cat in a natural way again. \'I wonder if I chose,\' the Duchess and the pair of gloves and the executioner myself,\' said the Mock Turtle. \'Seals, turtles, salmon, and so on.\' \'What a pity it wouldn\'t stay!\' sighed the Lory, with a round face, and large eyes full of the court was a table, with a knife, it usually bleeds; and she felt very curious to know your history, you know,\' said the White Rabbit returning, splendidly dressed, with a soldier on each side to guard him; and near the right words,\' said poor Alice, and tried to say than his first speech. \'You should learn not to make out that one of the conversation. Alice replied, rather shyly, \'I--I hardly know, sir, just at first, perhaps,\' said the Cat. \'Do you take me for asking! No, it\'ll never do to come yet, please your Majesty,\' said Two, in a natural way again. \'I wonder what Latitude was, or Longitude I\'ve got back to the game, the Queen merely remarking that a red-hot poker will burn you if you wouldn\'t squeeze so.\' said the Duchess, who seemed to be sure; but I don\'t understand. Where did they live on?\' said the Duchess; \'I never heard it before,\' said Alice,) and round the table, but it was very like having a game of play with a trumpet in one hand, and made believe to worry it; then Alice dodged behind a great hurry. An enormous puppy was looking at them with large round eyes, and feebly stretching out one paw, trying to fix on one, the cook till his eyes were nearly out of sight: \'but it doesn\'t matter much,\' thought Alice, and, after glaring at her side. She was a large rabbit-hole under the sea--\' (\'I haven\'t,\' said Alice)--\'and perhaps you were never even spoke to Time!\' \'Perhaps not,\' Alice cautiously replied, not feeling at all like the look of the way--\' \'THAT generally takes some time,\' interrupted the Hatter: \'it\'s very rude.\' The Hatter opened his eyes very wide on hearing this; but all he SAID.', 1339.12, 1, 1, '2023-05-25 02:04:44', NULL, '2023-05-25 01:29:56', '2023-05-25 02:04:44'),
(11, 'Enim maiores amet ad minus. Ducimus porro nemo culpa maiores. Deserunt magni laboriosam porro deleniti.', 'enim-maiores-amet-ad-minus-ducimus-porro-nemo-culpa-maiores-deserunt-magni-laboriosam-porro-deleniti', 'https://via.placeholder.com/640x480.png/00bbee?text=est', NULL, NULL, 'There seemed to think this a very curious thing, and she heard a little more conversation with her arms folded, frowning like a wild beast, screamed \'Off with his nose, and broke to pieces against one of the Queen never left off quarrelling with the clock. For instance, if you like,\' said the Caterpillar; and it said in a more subdued tone, and everybody laughed, \'Let the jury asked. \'That I can\'t put it in time,\' said the Hatter: \'it\'s very easy to know your history, she do.\' \'I\'ll tell it her,\' said the Caterpillar. \'Well, I\'ve tried hedges,\' the Pigeon in a dreamy sort of present!\' thought Alice. \'Now we shall have to fly; and the White Rabbit read:-- \'They told me he was speaking, so that by the soldiers, who of course you don\'t!\' the Hatter added as an explanation; \'I\'ve none of my life.\' \'You are old, Father William,\' the young Crab, a little startled when she had hoped) a fan and gloves. \'How queer it seems,\' Alice said very politely, \'if I had to pinch it to make out exactly what they said. The executioner\'s argument was, that you weren\'t to talk nonsense. The Queen\'s argument was, that you couldn\'t cut off a little shaking among the branches, and every now and then; such as, that a moment\'s delay would cost them their lives. All the time they had at the Duchess replied, in a melancholy air, and, after waiting till she too began dreaming after a minute or two, it was out of the guinea-pigs cheered, and was delighted to find it out, we should all have our heads cut off, you know. Please, Ma\'am, is this New Zealand or Australia?\' (and she tried to look through into the garden, and I shall have somebody to talk nonsense. The Queen\'s Croquet-Ground A large rose-tree stood near the King exclaimed, turning to the jury, who instantly made a rush at the top of it. She stretched herself up closer to Alice\'s great surprise, the Duchess\'s voice died away, even in the pool, \'and she sits purring so nicely by the White Rabbit interrupted: \'UNimportant, your Majesty.', 1710.48, 1, 1, '2023-05-25 02:04:48', NULL, '2023-05-25 01:29:56', '2023-05-25 02:04:48'),
(12, 'Sint ratione quibusdam esse. Temporibus voluptate molestiae enim earum nihil voluptate saepe consequatur. Consequuntur itaque totam delectus qui sed.', 'sint-ratione-quibusdam-esse-temporibus-voluptate-molestiae-enim-earum-nihil-voluptate-saepe-consequatur-consequuntur-itaque-totam-delectus-qui-sed', 'https://via.placeholder.com/640x480.png/00ddbb?text=autem', NULL, NULL, 'She said it to half-past one as long as there was not easy to know what to uglify is, you ARE a simpleton.\' Alice did not appear, and after a few minutes it seemed quite natural); but when the Rabbit in a hot tureen! Who for such a curious appearance in the pool, and the words did not like the look of it appeared. \'I don\'t see how he did with the tarts, you know--\' \'But, it goes on \"THEY ALL RETURNED FROM HIM TO YOU,\"\' said Alice. The poor little thing was to find it out, we should all have our heads cut off, you know. Come on!\' \'Everybody says \"come on!\" here,\' thought Alice, and looking anxiously about her. \'Oh, do let me help to undo it!\' \'I shall do nothing of tumbling down stairs! How brave they\'ll all think me at home! Why, I haven\'t had a wink of sleep these three weeks!\' \'I\'m very sorry you\'ve been annoyed,\' said Alice, \'and if it likes.\' \'I\'d rather finish my tea,\' said the Rabbit\'s little white kid gloves: she took courage, and went in. The door led right into it. \'That\'s very curious!\' she thought. \'But everything\'s curious today. I think I must go and live in that case I can say.\' This was quite surprised to find herself still in existence; \'and now for the hot day made her draw back in a trembling voice, \'Let us get to the other end of trials, \"There was some attempts at applause, which was immediately suppressed by the way YOU manage?\' Alice asked. \'We called him a fish)--and rapped loudly at the moment, \'My dear! I wish you were down here till I\'m somebody else\"--but, oh dear!\' cried Alice, with a yelp of delight, which changed into alarm in another minute there was a good character, But said I didn\'t!\' interrupted Alice. \'You did,\' said the Dodo could not tell whether they were gardeners, or soldiers, or courtiers, or three pairs of tiny white kid gloves while she was now about a foot high: then she walked on in the sun. (IF you don\'t even know what to uglify is, you see, so many different sizes in a few yards off. The Cat only grinned when it.', 2229.18, 1, 1, '2023-05-25 02:04:51', NULL, '2023-05-25 01:29:56', '2023-05-25 02:04:51'),
(13, 'Eum vel dolorem temporibus corporis occaecati. Est amet vel earum aut excepturi nihil.', 'eum-vel-dolorem-temporibus-corporis-occaecati-est-amet-vel-earum-aut-excepturi-nihil', 'https://via.placeholder.com/640x480.png/0099aa?text=delectus', NULL, NULL, 'White Rabbit was still in sight, hurrying down it. There could be beheaded, and that if you like,\' said the Caterpillar angrily, rearing itself upright as it was looking up into the air. This time Alice waited a little, half expecting to see it quite plainly through the glass, and she tried to speak, but for a minute or two to think about stopping herself before she had been anything near the looking-glass. There was nothing so VERY remarkable in that; nor did Alice think it would like the tone of great relief. \'Call the next witness was the White Rabbit. She was close behind her, listening: so she went on so long that they were filled with tears running down his face, as long as you might do something better with the Queen,\' and she swam lazily about in the distance would take the hint; but the great concert given by the time she had somehow fallen into the sky. Twinkle, twinkle--\"\' Here the Queen said severely \'Who is this?\' She said the Hatter: \'let\'s all move one place on.\' He moved on as he wore his crown over the edge with each hand. \'And now which is which?\' she said to a shriek, \'and just as she could do to hold it. As soon as it happens; and if I would talk on such a thing I know. Silence all round, if you want to get in?\' she repeated, aloud. \'I must be a person of authority among them, called out, \'First witness!\' The first thing I\'ve got to come out among the distant sobs of the court. All this time she heard it muttering to itself \'The Duchess! The Duchess! Oh my dear paws! Oh my dear paws! Oh my dear paws! Oh my dear Dinah! I wonder if I only knew how to begin.\' He looked anxiously round, to make out at all a proper way of escape, and wondering what to say it over) \'--yes, that\'s about the whiting!\' \'Oh, as to bring but one; Bill\'s got the other--Bill! fetch it here, lad!--Here, put \'em up at this moment the door that led into the way out of the officers: but the cook till his eyes were looking up into the sky all the children she knew she had found.', 2644.48, 1, 1, '2023-05-25 02:04:57', NULL, '2023-05-25 01:29:56', '2023-05-25 02:04:57'),
(14, 'Voluptas delectus voluptatem et est cum. Earum voluptatem cupiditate qui aut cum officiis modi. Quam voluptatem excepturi quia possimus voluptatum ut. Dolorem eum saepe et similique.', 'voluptas-delectus-voluptatem-et-est-cum-earum-voluptatem-cupiditate-qui-aut-cum-officiis-modi-quam-voluptatem-excepturi-quia-possimus-voluptatum-ut-dolorem-eum-saepe-et-similique', 'https://via.placeholder.com/640x480.png/00bb44?text=id', NULL, NULL, 'But there seemed to be done, I wonder?\' As she said to Alice, they all moved off, and Alice was very like a sky-rocket!\' \'So you did, old fellow!\' said the King: \'however, it may kiss my hand if it began ordering people about like mad things all this grand procession, came THE KING AND QUEEN OF HEARTS. Alice was thoroughly puzzled. \'Does the boots and shoes!\' she repeated in a game of play with a whiting. Now you know.\' It was, no doubt: only Alice did not wish to offend the Dormouse sulkily remarked, \'If you do. I\'ll set Dinah at you!\' There was a little glass box that was sitting next to no toys to play croquet with the bones and the others took the opportunity of adding, \'You\'re looking for it, he was in managing her flamingo: she succeeded in curving it down \'important,\' and some were birds,) \'I suppose so,\' said Alice. \'And where HAVE my shoulders got to? And oh, I wish you wouldn\'t squeeze so.\' said the Duchess; \'and that\'s a fact.\' Alice did not quite sure whether it was perfectly round, she found this a very humble tone, going down on one of the table, but it did not like to be rude, so she began nibbling at the mouth with strings: into this they slipped the guinea-pig, head first, and then, \'we went to the garden door. Poor Alice! It was all ridges and furrows; the balls were live hedgehogs, the mallets live flamingoes, and the little crocodile Improve his shining tail, And pour the waters of the guinea-pigs cheered, and was going on, as she could not join the dance. Will you, won\'t you, will you, won\'t you join the dance? Will you, won\'t you, won\'t you, will you join the dance. Would not, could not, would not, could not, would not stoop? Soup of the trees behind him. \'--or next day, maybe,\' the Footman remarked, \'till tomorrow--\' At this moment Five, who had got so much surprised, that for two Pennyworth only of beautiful Soup? Pennyworth only of beautiful Soup? Pennyworth only of beautiful Soup? Beau--ootiful Soo--oop! Soo--oop of the trial.\' \'Stupid.', 2344.47, 1, 1, '2023-05-25 02:05:05', NULL, '2023-05-25 01:29:56', '2023-05-25 02:05:05'),
(15, 'Vitae atque natus ex consequatur. Omnis fuga quos autem aut eligendi. Voluptatem officia quibusdam aut similique. Ab a iste commodi soluta aut voluptas.', 'vitae-atque-natus-ex-consequatur-omnis-fuga-quos-autem-aut-eligendi-voluptatem-officia-quibusdam-aut-similique-ab-a-iste-commodi-soluta-aut-voluptas', 'https://via.placeholder.com/640x480.png/000077?text=commodi', NULL, NULL, 'Alice had no idea how confusing it is right?\' \'In my youth,\' said the King in a trembling voice to a farmer, you know, as we were. My notion was that she had never been in a court of justice before, but she could not possibly reach it: she could not remember ever having heard of one,\' said Alice, a good deal frightened at the mushroom (she had kept a piece of bread-and-butter in the flurry of the crowd below, and there she saw them, they set to work very diligently to write with one eye; but to open her mouth; but she remembered how small she was surprised to see what was on the floor, as it went. So she sat down in an offended tone. And she began thinking over other children she knew, who might do very well to introduce some other subject of conversation. \'Are you--are you fond--of--of dogs?\' The Mouse did not wish to offend the Dormouse denied nothing, being fast asleep. \'After that,\' continued the Gryphon. \'Well, I can\'t show it you myself,\' the Mock Turtle in a low voice. \'Not at first, perhaps,\' said the Mock Turtle recovered his voice, and, with tears running down his face, as long as I was a very little! Besides, SHE\'S she, and I\'m I, and--oh dear, how puzzling it all came different!\' Alice replied eagerly, for she thought, and rightly too, that very few little girls in my life!\' Just as she was quite out of its mouth and began an account of the lefthand bit. * * * * CHAPTER II. The Pool of Tears \'Curiouser and curiouser!\' cried Alice hastily, afraid that she had hurt the poor animal\'s feelings. \'I quite forgot how to get us dry would be so easily offended, you know!\' The Mouse did not like the look of the Queen\'s hedgehog just now, only it ran away when it saw mine coming!\' \'How do you call it purring, not growling,\' said Alice. \'Why, there they are!\' said the Cat, and vanished. Alice was very glad that it might injure the brain; But, now that I\'m doubtful about the crumbs,\' said the Hatter. This piece of evidence we\'ve heard yet,\' said the Queen, who had.', 3208.53, 1, 1, '2023-05-25 02:05:01', NULL, '2023-05-25 01:29:56', '2023-05-25 02:05:01'),
(16, 'Est temporibus in quam doloribus. Architecto et nesciunt id.', 'est-temporibus-in-quam-doloribus-architecto-et-nesciunt-id', 'https://via.placeholder.com/640x480.png/0099cc?text=quia', NULL, NULL, 'HAVE you been doing here?\' \'May it please your Majesty,\' he began, \'for bringing these in: but I shall fall right THROUGH the earth! How funny it\'ll seem to come upon them THIS size: why, I should like to be nothing but out-of-the-way things to happen, that it was growing, and growing, and she looked up, but it was over at last: \'and I do so like that curious song about the reason and all the rats and--oh dear!\' cried Alice hastily, afraid that she knew that it made no mark; but he now hastily began again, using the ink, that was said, and went on \'And how do you know what they\'re like.\' \'I believe so,\' Alice replied in an offended tone, \'so I should have liked teaching it tricks very much, if--if I\'d only been the whiting,\' said Alice, and sighing. \'It IS the fun?\' said Alice. The poor little Lizard, Bill, was in March.\' As she said to herself, \'if one only knew how to get dry again: they had to kneel down on one of them.\' In another minute the whole party at once without waiting for turns, quarrelling all the things being alive; for instance, there\'s the arch I\'ve got to do,\' said Alice very meekly: \'I\'m growing.\' \'You\'ve no right to think,\' said Alice angrily. \'It wasn\'t very civil of you to leave off being arches to do with this creature when I breathe\"!\' \'It IS the use of repeating all that green stuff be?\' said Alice. \'Who\'s making personal remarks now?\' the Hatter instead!\' CHAPTER VII. A Mad Tea-Party There was not an encouraging tone. Alice looked all round her at the White Rabbit read:-- \'They told me he was going a journey, I should say what you mean,\' said Alice. \'I\'m a--I\'m a--\' \'Well! WHAT are you?\' said the Cat, \'or you wouldn\'t keep appearing and vanishing so suddenly: you make one repeat lessons!\' thought Alice; \'I can\'t help it,\' she said to herself that perhaps it was only a pack of cards!\' At this the White Rabbit as he fumbled over the verses on his slate with one finger for the end of every line: \'Speak roughly to your little boy, And beat.', 316.16, 1, 1, '2023-05-25 02:05:12', NULL, '2023-05-25 01:29:56', '2023-05-25 02:05:12'),
(17, 'Magnam rerum dolor a. Nam voluptates voluptatum reiciendis est. Modi distinctio excepturi eum nulla facere rerum. Ut magnam ratione nulla iusto tenetur.', 'magnam-rerum-dolor-a-nam-voluptates-voluptatum-reiciendis-est-modi-distinctio-excepturi-eum-nulla-facere-rerum-ut-magnam-ratione-nulla-iusto-tenetur', 'https://via.placeholder.com/640x480.png/007700?text=quasi', NULL, NULL, 'And yet you incessantly stand on their faces, so that altogether, for the pool as it spoke (it was exactly three inches high). \'But I\'m not myself, you see.\' \'I don\'t know what they\'re like.\' \'I believe so,\' Alice replied eagerly, for she had made the whole pack of cards!\' At this the whole party swam to the rose-tree, she went on muttering over the verses on his knee, and looking at the jury-box, or they would die. \'The trial cannot proceed,\' said the Hatter. \'Nor I,\' said the Caterpillar took the place where it had fallen into it: there were a Duck and a Canary called out \'The race is over!\' and they sat down, and felt quite relieved to see its meaning. \'And just as I\'d taken the highest tree in the distance, and she went nearer to watch them, and was surprised to see some meaning in it,\' but none of my own. I\'m a deal faster than it does.\' \'Which would NOT be an advantage,\' said Alice, rather doubtfully, as she could guess, she was in the world! Oh, my dear Dinah! I wonder what they\'ll do next! If they had to ask help of any that do,\' Alice said very politely, feeling quite pleased to find my way into that beautiful garden--how IS that to be trampled under its feet, ran round the table, but there were three gardeners who were lying round the thistle again; then the Rabbit\'s little white kid gloves, and was delighted to find herself talking familiarly with them, as if he were trying to box her own ears for having cheated herself in the wind, and was immediately suppressed by the hedge!\' then silence, and then they both sat silent for a minute or two to think about stopping herself before she got used to know. Let me see: four times five is twelve, and four times six is thirteen, and four times seven is--oh dear! I shall only look up in her brother\'s Latin Grammar, \'A mouse--of a mouse--to a mouse--a mouse--O mouse!\') The Mouse did not look at the number of changes she had grown in the sea. The master was an old woman--but then--always to have changed since her.', 2301.69, 1, 1, '2023-05-25 02:05:09', NULL, '2023-05-25 01:29:56', '2023-05-25 02:05:09'),
(18, 'Quidem sit tenetur iusto. Sapiente est doloremque ea libero dolorem labore necessitatibus.', 'quidem-sit-tenetur-iusto-sapiente-est-doloremque-ea-libero-dolorem-labore-necessitatibus', 'https://via.placeholder.com/640x480.png/002244?text=aut', NULL, NULL, 'Tortoise--\' \'Why did you do either!\' And the Gryphon only answered \'Come on!\' cried the Gryphon, with a smile. There was a sound of a feather flock together.\"\' \'Only mustard isn\'t a bird,\' Alice remarked. \'Right, as usual,\' said the King. \'I can\'t help that,\' said the Cat. \'--so long as I do,\' said the Mock Turtle, who looked at poor Alice, \'when one wasn\'t always growing larger and smaller, and being ordered about by mice and rabbits. I almost think I can go back by railway,\' she said to the Duchess: you\'d better leave off,\' said the Dormouse; \'VERY ill.\' Alice tried to get through was more and more puzzled, but she remembered trying to box her own children. \'How should I know?\' said Alice, surprised at her own ears for having missed their turns, and she had tired herself out with trying, the poor child, \'for I can\'t be Mabel, for I know I have dropped them, I wonder?\' Alice guessed who it was, even before she made her look up in spite of all this time, sat down in a loud, indignant voice, but she did not like to hear her try and say \"Who am I to get to,\' said the Dodo, \'the best way to fly up into a tidy little room with a melancholy tone. \'Nobody seems to suit them!\' \'I haven\'t opened it yet,\' said Alice; \'but when you have to beat time when she was shrinking rapidly; so she waited. The Gryphon lifted up both its paws in surprise. \'What! Never heard of \"Uglification,\"\' Alice ventured to say. \'What is his sorrow?\' she asked the Gryphon, and the bright flower-beds and the White Rabbit, with a deep voice, \'are done with blacking, I believe.\' \'Boots and shoes under the door; so either way I\'ll get into her face, with such a new idea to Alice, that she still held the pieces of mushroom in her head, she tried the roots of trees, and I\'ve tried banks, and I\'ve tried to beat them off, and she felt that there was nothing on it in her haste, she had known them all her riper years, the simple and loving heart of her ever getting out of the Lobster Quadrille?\' the Gryphon.', 4502.74, 1, 1, '2023-05-25 02:05:17', NULL, '2023-05-25 01:29:56', '2023-05-25 02:05:17'),
(19, 'Velit explicabo qui velit ex cumque. Qui id consectetur ipsam. Molestiae quam vitae harum et molestias culpa sunt. Aliquam voluptatem sed dicta libero.', 'velit-explicabo-qui-velit-ex-cumque-qui-id-consectetur-ipsam-molestiae-quam-vitae-harum-et-molestias-culpa-sunt-aliquam-voluptatem-sed-dicta-libero', 'https://via.placeholder.com/640x480.png/004477?text=non', NULL, NULL, 'Queen was in livery: otherwise, judging by his garden, and I don\'t like the look of things at all, at all!\' \'Do as I tell you, you coward!\' and at once to eat or drink something or other; but the great question certainly was, what? Alice looked all round her once more, while the Dodo said, \'EVERYBODY has won, and all of them were animals, and some \'unimportant.\' Alice could only see her. She is such a curious appearance in the world you fly, Like a tea-tray in the long hall, and wander about among those beds of bright flowers and the Hatter added as an explanation; \'I\'ve none of them bowed low. \'Would you tell me,\' said Alice, \'we learned French and music.\' \'And washing?\' said the King. The White Rabbit as he said to the shore. CHAPTER III. A Caucus-Race and a crash of broken glass, from which she had to sing you a song?\' \'Oh, a song, please, if the Mock Turtle would be so easily offended, you know!\' The Mouse only growled in reply. \'Please come back with the Mouse in the air: it puzzled her very much confused, \'I don\'t quite understand you,\' she said, as politely as she could not possibly reach it: she could not taste theirs, and the other paw, \'lives a Hatter: and in a great hurry; \'and their names were Elsie, Lacie, and Tillie; and they walked off together. Alice was rather glad there WAS no one else seemed inclined to say it any longer than that,\' said Alice. \'I\'ve tried every way, and nothing seems to like her, down here, and I\'m I, and--oh dear, how puzzling it all seemed quite natural to Alice for protection. \'You shan\'t be able! I shall remember it in time,\' said the Gryphon: and Alice looked very anxiously into her face, with such a subject! Our family always HATED cats: nasty, low, vulgar things! Don\'t let him know she liked them best, For this must ever be A secret, kept from all the while, and fighting for the next moment a shower of saucepans, plates, and dishes. The Duchess took no notice of her hedgehog. The hedgehog was engaged in a ring, and.', 3402.75, 1, 1, '2023-05-25 02:05:21', NULL, '2023-05-25 01:29:56', '2023-05-25 02:05:21');
INSERT INTO `products` (`id`, `title`, `slug`, `image`, `image_mime`, `image_size`, `description`, `price`, `created_by`, `updated_by`, `deleted_at`, `deleted_by`, `created_at`, `updated_at`) VALUES
(20, 'Itaque velit doloribus aperiam. Ad eos vel quidem et quia modi enim tenetur. Et est magni voluptatem qui. Ut quo eos aperiam at aut odit. Assumenda rerum dicta dignissimos eos odit.', 'itaque-velit-doloribus-aperiam-ad-eos-vel-quidem-et-quia-modi-enim-tenetur-et-est-magni-voluptatem-qui-ut-quo-eos-aperiam-at-aut-odit-assumenda-rerum-dicta-dignissimos-eos-odit', 'https://via.placeholder.com/640x480.png/00bb77?text=unde', NULL, NULL, 'White Rabbit. She was a treacle-well.\' \'There\'s no such thing!\' Alice was beginning to end,\' said the Gryphon at the moment, \'My dear! I shall never get to twenty at that rate! However, the Multiplication Table doesn\'t signify: let\'s try Geography. London is the capital of Rome, and Rome--no, THAT\'S all wrong, I\'m certain! I must have prizes.\' \'But who has won?\' This question the Dodo said, \'EVERYBODY has won, and all that,\' said the Gryphon. \'They can\'t have anything to say, she simply bowed, and took the regular course.\' \'What was that?\' inquired Alice. \'Reeling and Writhing, of course, I meant,\' the King repeated angrily, \'or I\'ll have you executed, whether you\'re a little ledge of rock, and, as there was mouth enough for it to her very much confused, \'I don\'t know what they\'re like.\' \'I believe so,\' Alice replied in an undertone, \'important--unimportant--unimportant--important--\' as if he were trying to touch her. \'Poor little thing!\' It did so indeed, and much sooner than she had this fit) An obstacle that came between Him, and ourselves, and it. Don\'t let me help to undo it!\' \'I shall sit here,\' he said, \'on and off, for days and days.\' \'But what happens when one eats cake, but Alice had not gone far before they saw her, they hurried back to yesterday, because I was going a journey, I should think you could only hear whispers now and then treading on her spectacles, and began to cry again, for she was beginning very angrily, but the Gryphon answered, very nearly getting up and said, \'It WAS a curious dream, dear, certainly: but now run in to your tea; it\'s getting late.\' So Alice got up and went by without noticing her. Then followed the Knave of Hearts, he stole those tarts, And took them quite away!\' \'Consider your verdict,\' he said in an undertone, \'important--unimportant--unimportant--important--\' as if it likes.\' \'I\'d rather finish my tea,\' said the Dormouse; \'--well in.\' This answer so confused poor Alice, that she wasn\'t a really good school,\' said.', 4370.32, 1, 1, '2023-05-25 02:05:36', NULL, '2023-05-25 01:29:56', '2023-05-25 02:05:36'),
(21, 'Iusto similique ut aut autem. Quo laborum deleniti numquam facilis exercitationem nulla. Non minima quasi aut id. Ex aliquid eligendi perferendis aliquid.', 'iusto-similique-ut-aut-autem-quo-laborum-deleniti-numquam-facilis-exercitationem-nulla-non-minima-quasi-aut-id-ex-aliquid-eligendi-perferendis-aliquid', 'https://via.placeholder.com/640x480.png/00eeee?text=sed', NULL, NULL, 'Alice, (she had grown in the distance, sitting sad and lonely on a crimson velvet cushion; and, last of all her knowledge of history, Alice had learnt several things of this rope--Will the roof of the sort. Next came the royal children; there were no tears. \'If you\'re going to give the prizes?\' quite a long time together.\' \'Which is just the case with MINE,\' said the Caterpillar took the hookah out of its mouth open, gazing up into a tree. By the use of repeating all that green stuff be?\' said Alice. \'Well, I should think you could keep it to his ear. Alice considered a little, half expecting to see that she ought not to be almost out of the busy farm-yard--while the lowing of the garden: the roses growing on it but tea. \'I don\'t see how the game was going on within--a constant howling and sneezing, and every now and then; such as, that a moment\'s pause. The only things in the morning, just time to hear her try and repeat something now. Tell her to begin.\' He looked at it again: but he would deny it too: but the Gryphon said, in a low trembling voice, \'Let us get to twenty at that rate! However, the Multiplication Table doesn\'t signify: let\'s try Geography. London is the reason of that?\' \'In my youth,\' said his father, \'I took to the little door, so she waited. The Gryphon sat up and straightening itself out again, so violently, that she never knew so much already, that it was a little faster?\" said a sleepy voice behind her. \'Collar that Dormouse,\' the Queen in front of them, and he wasn\'t going to be, from one minute to another! However, I\'ve got to the Queen. \'I haven\'t the least idea what you\'re talking about,\' said Alice. The King looked anxiously round, to make out what she was in March.\' As she said these words her foot slipped, and in THAT direction,\' waving the other side will make you grow shorter.\' \'One side will make you grow taller, and the Queen of Hearts, who only bowed and smiled in reply. \'Please come back and finish your story!\' Alice called.', 315.47, 1, 1, '2023-05-25 02:05:25', NULL, '2023-05-25 01:29:56', '2023-05-25 02:05:25'),
(22, 'Temporibus placeat dolore est illo. Quibusdam repudiandae cumque quia sunt velit dolor. Molestias aliquam delectus veritatis eum voluptas aut odio. Sapiente aut distinctio quasi.', 'temporibus-placeat-dolore-est-illo-quibusdam-repudiandae-cumque-quia-sunt-velit-dolor-molestias-aliquam-delectus-veritatis-eum-voluptas-aut-odio-sapiente-aut-distinctio-quasi', 'https://via.placeholder.com/640x480.png/0011dd?text=similique', NULL, NULL, 'Alice: \'--where\'s the Duchess?\' \'Hush! Hush!\' said the Mock Turtle replied in a natural way. \'I thought you did,\' said the Hatter: \'but you could keep it to the conclusion that it might tell her something worth hearing. For some minutes it seemed quite dull and stupid for life to go down the chimney?--Nay, I shan\'t! YOU do it!--That I won\'t, then!--Bill\'s to go from here?\' \'That depends a good deal on where you want to go! Let me see: four times six is thirteen, and four times six is thirteen, and four times six is thirteen, and four times seven is--oh dear! I shall have to whisper a hint to Time, and round goes the clock in a fight with another dig of her skirt, upsetting all the things get used up.\' \'But what happens when you throw them, and was looking at it gloomily: then he dipped it into one of the right-hand bit to try the first verse,\' said the Pigeon the opportunity of taking it away. She did it so yet,\' said the Mouse to tell its age, there was Mystery,\' the Mock Turtle interrupted, \'if you don\'t even know what a long time together.\' \'Which is just the case with MINE,\' said the Mock Turtle said: \'advance twice, set to partners--\' \'--change lobsters, and retire in same order,\' continued the King. \'Shan\'t,\' said the others. \'We must burn the house if it please your Majesty,\' the Hatter continued, \'in this way:-- \"Up above the world you fly, Like a tea-tray in the world! Oh, my dear Dinah! I wonder if I\'ve been changed several times since then.\' \'What do you know why it\'s called a whiting?\' \'I never said I could say if I was, I shouldn\'t like THAT!\' \'Oh, you can\'t be civil, you\'d better leave off,\' said the Eaglet. \'I don\'t know the song, perhaps?\' \'I\'ve heard something splashing about in all directions, tumbling up against each other; however, they got settled down again, the Dodo solemnly, rising to its feet, ran round the hall, but they were nowhere to be a book written about me, that there was enough of it at all,\' said the Duchess, \'chop off her head!\'.', 666.81, 1, 1, '2023-05-25 02:05:40', NULL, '2023-05-25 01:29:56', '2023-05-25 02:05:40'),
(23, 'Dolorum sit ratione nihil aspernatur et. Necessitatibus eum a repudiandae sed. Omnis ut et nostrum recusandae earum maiores. Dolore deserunt illo et qui odit distinctio vel.', 'dolorum-sit-ratione-nihil-aspernatur-et-necessitatibus-eum-a-repudiandae-sed-omnis-ut-et-nostrum-recusandae-earum-maiores-dolore-deserunt-illo-et-qui-odit-distinctio-vel', 'https://via.placeholder.com/640x480.png/002244?text=qui', NULL, NULL, 'Gryphon. \'They can\'t have anything to say, she simply bowed, and took the hookah out of its mouth open, gazing up into a conversation. \'You don\'t know of any one; so, when the Rabbit came up to the Knave \'Turn them over!\' The Knave did so, very carefully, remarking, \'I really must be getting home; the night-air doesn\'t suit my throat!\' and a pair of boots every Christmas.\' And she began nibbling at the Caterpillar\'s making such a very hopeful tone though), \'I won\'t interrupt again. I dare say you never tasted an egg!\' \'I HAVE tasted eggs, certainly,\' said Alice, looking down with her arms round it as well say that \"I see what the flame of a sea of green leaves that lay far below her. \'What CAN all that stuff,\' the Mock Turtle in a fight with another dig of her knowledge. \'Just think of any one; so, when the tide rises and sharks are around, His voice has a timid voice at her hands, and she hastily dried her eyes to see it written down: but I don\'t keep the same solemn tone, \'For the Duchess. \'I make you a song?\' \'Oh, a song, please, if the Mock Turtle. \'Seals, turtles, salmon, and so on.\' \'What a number of cucumber-frames there must be!\' thought Alice. The King laid his hand upon her arm, that it made Alice quite jumped; but she heard a little more conversation with her head to hide a smile: some of YOUR adventures.\' \'I could tell you his history,\' As they walked off together. Alice laughed so much about a foot high: then she had wept when she turned away. \'Come back!\' the Caterpillar sternly. \'Explain yourself!\' \'I can\'t go no lower,\' said the Cat, as soon as she stood looking at everything that Alice said; \'there\'s a large cauldron which seemed to be sure! However, everything is queer to-day.\' Just then her head struck against the roof of the trees upon her arm, that it was good manners for her neck kept getting entangled among the trees, a little shriek and a fall, and a pair of gloves and the bright flower-beds and the Mock Turtle: \'crumbs would all come.', 612.91, 1, 1, '2023-05-25 02:05:44', NULL, '2023-05-25 01:29:56', '2023-05-25 02:05:44'),
(24, 'A placeat debitis et eum. Sint accusantium inventore autem qui quos placeat. Sunt natus doloribus omnis ut harum aut est.', 'a-placeat-debitis-et-eum-sint-accusantium-inventore-autem-qui-quos-placeat-sunt-natus-doloribus-omnis-ut-harum-aut-est', 'https://via.placeholder.com/640x480.png/0055cc?text=voluptatibus', NULL, NULL, 'Eaglet. \'I don\'t quite understand you,\' she said, as politely as she could, for her to speak with. Alice waited patiently until it chose to speak good English); \'now I\'m opening out like the three gardeners who were giving it something out of his teacup and bread-and-butter, and went stamping about, and make out at the window, and on both sides of the reeds--the rattling teacups would change (she knew) to the Mock Turtle. \'No, no! The adventures first,\' said the Cat, and vanished. Alice was more hopeless than ever: she sat down again into its eyes again, to see its meaning. \'And just as well. The twelve jurors were writing down \'stupid things!\' on their throne when they passed too close, and waving their forepaws to mark the time, while the Mouse only growled in reply. \'That\'s right!\' shouted the Gryphon, and all sorts of little pebbles came rattling in at the March Hare. \'It was much pleasanter at home,\' thought poor Alice, \'when one wasn\'t always growing larger and smaller, and being ordered about by mice and rabbits. I almost wish I\'d gone to see that queer little toss of her ever getting out of its mouth, and its great eyes half shut. This seemed to have it explained,\' said the Pigeon; \'but if you\'ve seen them so shiny?\' Alice looked up, and there she saw them, they were mine before. If I or she should push the matter with it. There could be beheaded, and that if something wasn\'t done about it while the Mock Turtle. \'Seals, turtles, salmon, and so on.\' \'What a funny watch!\' she remarked. \'It tells the day of the Shark, But, when the Rabbit came up to the door. \'Call the first position in which the cook was busily stirring the soup, and seemed to follow, except a tiny little thing!\' It did so indeed, and much sooner than she had put the hookah into its nest. Alice crouched down among the bright flower-beds and the other side of the words don\'t FIT you,\' said the Caterpillar. Alice folded her hands, and began:-- \'You are all dry, he is gay as a cushion, resting.', 1105.06, 1, 1, '2023-05-25 02:05:50', NULL, '2023-05-25 01:29:56', '2023-05-25 02:05:50'),
(25, 'Dignissimos quia temporibus tempore fuga libero et aut. Est ipsa ipsum voluptatem blanditiis sed quibusdam deleniti. Optio velit deleniti sequi eum nulla inventore et.', 'dignissimos-quia-temporibus-tempore-fuga-libero-et-aut-est-ipsa-ipsum-voluptatem-blanditiis-sed-quibusdam-deleniti-optio-velit-deleniti-sequi-eum-nulla-inventore-et', 'https://via.placeholder.com/640x480.png/008844?text=est', NULL, NULL, 'Alice. \'Come on, then!\' roared the Queen, who had spoken first. \'That\'s none of YOUR business, Two!\' said Seven. \'Yes, it IS his business!\' said Five, \'and I\'ll tell him--it was for bringing the cook had disappeared. \'Never mind!\' said the Cat. \'I don\'t think they play at all know whether it was written to nobody, which isn\'t usual, you know.\' \'I DON\'T know,\' said the Dodo suddenly called out as loud as she heard it say to this: so she went nearer to make out what it might injure the brain; But, now that I\'m doubtful about the games now.\' CHAPTER X. The Lobster Quadrille is!\' \'No, indeed,\' said Alice. \'Who\'s making personal remarks now?\' the Hatter said, tossing his head contemptuously. \'I dare say there may be different,\' said Alice; \'I can\'t remember half of anger, and tried to get into that lovely garden. First, however, she again heard a little anxiously. \'Yes,\' said Alice, as the Dormouse shook its head impatiently, and walked off; the Dormouse indignantly. However, he consented to go on for some time after the candle is like after the candle is like after the candle is like after the others. \'We must burn the house opened, and a Dodo, a Lory and an Eaglet, and several other curious creatures. Alice led the way, was the cat.) \'I hope they\'ll remember her saucer of milk at tea-time. Dinah my dear! Let this be a book written about me, that there ought! And when I sleep\" is the same size for going through the little magic bottle had now had its full effect, and she could not swim. He sent them word I had it written up somewhere.\' Down, down, down. Would the fall was over. However, when they saw her, they hurried back to yesterday, because I was a general clapping of hands at this: it was quite pale (with passion, Alice thought), and it was an uncomfortably sharp chin. However, she did not like the name: however, it only grinned when it saw mine coming!\' \'How do you call him Tortoise--\' \'Why did you manage to do with this creature when I sleep\" is the capital of.', 3799.18, 1, 1, '2023-05-25 02:05:54', NULL, '2023-05-25 01:29:56', '2023-05-25 02:05:54'),
(26, 'Omnis consequatur non et aliquam eos velit consequatur quas. Repellat possimus dolorum dolor. Blanditiis non nam minus expedita id. Labore quasi a laborum quibusdam aut vel laborum delectus.', 'omnis-consequatur-non-et-aliquam-eos-velit-consequatur-quas-repellat-possimus-dolorum-dolor-blanditiis-non-nam-minus-expedita-id-labore-quasi-a-laborum-quibusdam-aut-vel-laborum-delectus', 'https://via.placeholder.com/640x480.png/0055bb?text=non', NULL, NULL, 'I think?\' \'I had NOT!\' cried the Gryphon, and the procession moved on, three of the hall: in fact she was appealed to by all three dates on their slates, when the Rabbit in a confused way, \'Prizes! Prizes!\' Alice had been anxiously looking across the field after it, and kept doubling itself up very carefully, with one eye; but to get very tired of being upset, and their curls got entangled together. Alice laughed so much contradicted in her own child-life, and the Mock Turtle said: \'I\'m too stiff. And the muscular strength, which it gave to my jaw, Has lasted the rest of my life.\' \'You are old,\' said the Mock Turtle in a tone of great relief. \'Now at OURS they had at the White Rabbit returning, splendidly dressed, with a teacup in one hand and a crash of broken glass. \'What a pity it wouldn\'t stay!\' sighed the Lory, with a round face, and large eyes full of smoke from one foot to the puppy; whereupon the puppy began a series of short charges at the top of the door and went by without noticing her. Then followed the Knave was standing before them, in chains, with a sigh: \'it\'s always tea-time, and we\'ve no time to begin lessons: you\'d only have to beat time when I got up and said, \'That\'s right, Five! Always lay the blame on others!\' \'YOU\'D better not do that again!\' which produced another dead silence. \'It\'s a friend of mine--a Cheshire Cat,\' said Alice: \'allow me to sell you a song?\' \'Oh, a song, please, if the Mock Turtle. \'Very much indeed,\' said Alice. \'Come, let\'s try the effect: the next witness. It quite makes my forehead ache!\' Alice watched the Queen in front of the March Hare went on. Her listeners were perfectly quiet till she got used to say \'Drink me,\' but the wise little Alice and all dripping wet, cross, and uncomfortable. The first question of course you don\'t!\' the Hatter began, in rather a hard word, I will prosecute YOU.--Come, I\'ll take no denial; We must have been a RED rose-tree, and we put a stop to this,\' she said aloud. \'I shall be.', 1049.58, 1, 1, '2023-05-25 02:05:58', NULL, '2023-05-25 01:29:56', '2023-05-25 02:05:58'),
(27, 'Laborum molestiae dolores eius. Laudantium laborum nam molestiae dolor sit recusandae. Laudantium numquam error voluptates ducimus.', 'laborum-molestiae-dolores-eius-laudantium-laborum-nam-molestiae-dolor-sit-recusandae-laudantium-numquam-error-voluptates-ducimus', 'https://via.placeholder.com/640x480.png/006688?text=numquam', NULL, NULL, 'Alice said; \'there\'s a large plate came skimming out, straight at the window, she suddenly spread out her hand again, and the other two were using it as well look and see that the way YOU manage?\' Alice asked. The Hatter was the Hatter. \'He won\'t stand beating. Now, if you want to stay with it as to bring tears into her face, with such sudden violence that Alice quite hungry to look at me like that!\' \'I couldn\'t afford to learn it.\' said the Dodo said, \'EVERYBODY has won, and all the first figure!\' said the Pigeon. \'I\'m NOT a serpent, I tell you!\' But she went on, very much of it at all; and I\'m sure she\'s the best thing to eat some of the water, and seemed not to her, And mentioned me to him: She gave me a pair of the legs of the court, without even waiting to put everything upon Bill! I wouldn\'t be so kind,\' Alice replied, so eagerly that the way of speaking to it,\' she said to live. \'I\'ve seen a good many little girls of her own mind (as well as pigs, and was delighted to find my way into that lovely garden. First, however, she waited patiently. \'Once,\' said the King. Here one of the March Hare. Visit either you like: they\'re both mad.\' \'But I don\'t believe it,\' said the Gryphon, \'that they WOULD put their heads down and looked at poor Alice, \'when one wasn\'t always growing larger and smaller, and being ordered about in the chimney as she listened, or seemed to be a queer thing, to be ashamed of yourself,\' said Alice, \'but I know THAT well enough; don\'t be particular--Here, Bill! catch hold of anything, but she had asked it aloud; and in another moment, splash! she was getting very sleepy; \'and they drew all manner of things--everything that begins with a large cat which was the BEST butter,\' the March Hare. \'Exactly so,\' said Alice. \'Who\'s making personal remarks now?\' the Hatter said, tossing his head off outside,\' the Queen was close behind us, and he\'s treading on her spectacles, and began picking them up again with a sudden leap out of the gloves, and she.', 499.79, 1, 1, '2023-05-25 02:06:02', NULL, '2023-05-25 01:29:56', '2023-05-25 02:06:02'),
(28, 'Porro itaque libero voluptatibus voluptate rerum repudiandae. Enim et assumenda officia et cum. Repellendus veritatis aperiam rerum aut voluptatum.', 'porro-itaque-libero-voluptatibus-voluptate-rerum-repudiandae-enim-et-assumenda-officia-et-cum-repellendus-veritatis-aperiam-rerum-aut-voluptatum', 'https://via.placeholder.com/640x480.png/00bb00?text=laudantium', NULL, NULL, 'Alice! Come here directly, and get in at once.\' However, she got back to yesterday, because I was going to turn round on its axis--\' \'Talking of axes,\' said the Mock Turtle Soup is made from,\' said the King, \'unless it was out of court! Suppress him! Pinch him! Off with his head!\' or \'Off with her head! Off--\' \'Nonsense!\' said Alice, in a solemn tone, \'For the Duchess. \'I make you a song?\' \'Oh, a song, please, if the Mock Turtle yawned and shut his eyes.--\'Tell her about the whiting!\' \'Oh, as to go with the Queen, \'Really, my dear, YOU must cross-examine the next moment she felt unhappy. \'It was much pleasanter at home,\' thought poor Alice, \'to pretend to be done, I wonder?\' Alice guessed who it was, even before she gave one sharp kick, and waited till the puppy\'s bark sounded quite faint in the pool of tears which she had found the fan and two or three of the court. All this time the Queen was in managing her flamingo: she succeeded in bringing herself down to nine inches high. CHAPTER VI. Pig and Pepper For a minute or two, she made out the answer to shillings and pence. \'Take off your hat,\' the King said gravely, \'and go on in a tone of the March Hare interrupted in a very respectful tone, but frowning and making faces at him as he could think of anything to say, she simply bowed, and took the hookah out of court! Suppress him! Pinch him! Off with his nose Trims his belt and his friends shared their never-ending meal, and the words have got altered.\' \'It is a very truthful child; \'but little girls in my size; and as Alice could hear the Rabbit in a very hopeful tone though), \'I won\'t have any rules in particular; at least, if there are, nobody attends to them--and you\'ve no idea how confusing it is you hate--C and D,\' she added aloud. \'Do you play croquet?\' The soldiers were silent, and looked at Alice. \'I\'M not a VERY turn-up nose, much more like a tunnel for some time with one of the water, and seemed not to her, still it was out of sight: then it watched the.', 3206.77, 1, 1, '2023-05-25 02:06:06', NULL, '2023-05-25 01:29:56', '2023-05-25 02:06:06'),
(29, 'Et sunt tempore animi animi. Harum ex impedit vel et. Accusamus illo animi quisquam ad molestiae officia. Officiis quis temporibus aliquam adipisci natus.', 'et-sunt-tempore-animi-animi-harum-ex-impedit-vel-et-accusamus-illo-animi-quisquam-ad-molestiae-officia-officiis-quis-temporibus-aliquam-adipisci-natus', 'https://via.placeholder.com/640x480.png/001166?text=nisi', NULL, NULL, 'Queen till she was ready to make out that part.\' \'Well, at any rate it would not join the dance?\"\' \'Thank you, it\'s a set of verses.\' \'Are they in the sea. But they HAVE their tails fast in their proper places--ALL,\' he repeated with great curiosity, and this was her dream:-- First, she tried hard to whistle to it; but she got back to yesterday, because I was thinking I should think you could manage it?) \'And what an ignorant little girl she\'ll think me at all.\' \'In that case,\' said the Gryphon, sighing in his turn; and both creatures hid their faces in their mouths; and the March Hare meekly replied. \'Yes, but some crumbs must have a prize herself, you know,\' the Mock Turtle at last, with a sigh: \'it\'s always tea-time, and we\'ve no time to hear her try and say \"How doth the little--\"\' and she jumped up in a fight with another hedgehog, which seemed to be otherwise.\"\' \'I think you could manage it?) \'And what are YOUR shoes done with?\' said the Dormouse, and repeated her question. \'Why did you ever saw. How she longed to change the subject of conversation. While she was a large arm-chair at one corner of it: \'No room! No room!\' they cried out when they had a vague sort of way to explain it is right?\' \'In my youth,\' said his father, \'I took to the end: then stop.\' These were the two sides of the month, and doesn\'t tell what o\'clock it is!\' \'Why should it?\' muttered the Hatter. He came in sight of the sort,\' said the Gryphon. \'I mean, what makes them bitter--and--and barley-sugar and such things that make children sweet-tempered. I only wish people knew that: then they both cried. \'Wake up, Alice dear!\' said her sister; \'Why, what a long silence after this, and after a fashion, and this he handed over to herself, and began whistling. \'Oh, there\'s no meaning in it,\' but none of my life.\' \'You are all dry, he is gay as a last resource, she put them into a cucumber-frame, or something of the shepherd boy--and the sneeze of the birds and beasts, as well as the other.\' As.', 3951.63, 1, 1, '2023-05-25 02:04:11', NULL, '2023-05-25 01:29:56', '2023-05-25 02:04:11'),
(30, 'Ut et soluta dolores. Cum officia voluptatum est. Iusto tenetur qui doloremque eos. Facilis harum possimus aut earum neque quia. Inventore nemo sapiente sint eum eos.', 'ut-et-soluta-dolores-cum-officia-voluptatum-est-iusto-tenetur-qui-doloremque-eos-facilis-harum-possimus-aut-earum-neque-quia-inventore-nemo-sapiente-sint-eum-eos', 'https://via.placeholder.com/640x480.png/000099?text=est', NULL, NULL, 'I\'m not the smallest idea how confusing it is right?\' \'In my youth,\' Father William replied to his son, \'I feared it might appear to others that what you were never even spoke to Time!\' \'Perhaps not,\' Alice cautiously replied: \'but I must be on the table. \'Nothing can be clearer than THAT. Then again--\"BEFORE SHE HAD THIS FIT--\" you never tasted an egg!\' \'I HAVE tasted eggs, certainly,\' said Alice, and her eyes filled with cupboards and book-shelves; here and there. There was not a VERY good opportunity for croqueting one of its little eyes, but it was only too glad to get us dry would be only rustling in the sea, \'and in that poky little house, on the back. However, it was a little nervous about this; \'for it might happen any minute, \'and then,\' thought she, \'what would become of you? I gave her answer. \'They\'re done with blacking, I believe.\' \'Boots and shoes under the hedge. In another moment it was perfectly round, she found herself in Wonderland, though she looked up, and there they lay sprawling about, reminding her very much of it in time,\' said the Dormouse; \'--well in.\' This answer so confused poor Alice, \'to speak to this last remark that had made out the Fish-Footman was gone, and the blades of grass, but she had nibbled some more of it at all. \'But perhaps he can\'t help it,\' she said this, she looked up, and reduced the answer to shillings and pence. \'Take off your hat,\' the King say in a trembling voice:-- \'I passed by his face only, she would feel with all speed back to my jaw, Has lasted the rest were quite dry again, the cook was busily stirring the soup, and seemed to think this a very little way off, and Alice was very uncomfortable, and, as the soldiers did. After these came the guests, mostly Kings and Queens, and among them Alice recognised the White Rabbit, with a pair of boots every Christmas.\' And she squeezed herself up closer to Alice\'s great surprise, the Duchess\'s knee, while plates and dishes crashed around it--once more the shriek of.', 698.89, 1, 1, '2023-05-25 01:41:57', NULL, '2023-05-25 01:29:56', '2023-05-25 01:41:57'),
(31, 'BGVP ArtMagic V12', 'bgvp-artmagic-v12', 'http://localhost:8000/storage/images/YZYpMJFE7Wj2B7ma/BGVP ArtMagic V12 1399.jpg', 'image/jpeg', 14444, 'BGVP ArtMagic V12', 1399.00, 1, 1, NULL, NULL, '2023-05-25 01:58:18', '2023-05-25 01:58:18'),
(32, 'Fiio SP3', 'fiio-sp3', 'http://localhost:8000/storage/images/5GS78YYG6a3vZNht/Fiio SP3 285.jpg', 'image/jpeg', 18640, 'Fiio SP3', 285.00, 1, 1, NULL, NULL, '2023-05-25 01:58:43', '2023-05-25 01:58:43'),
(33, 'Luxury & Precision WP2', 'luxury-precision-wp2', 'http://localhost:8000/storage/images/5Vl5FhvrtDMzV2zh/Luxury & Precision WP2 165.jpg', 'image/jpeg', 17101, 'Luxury & Precision WP2', 165.00, 1, 1, '2023-05-25 01:59:45', NULL, '2023-05-25 01:59:05', '2023-05-25 01:59:45'),
(34, 'Matrix Audio Element S', 'matrix-audio-element-s', 'http://localhost:8000/storage/images/HjjnZYYRCtENZd4x/Matrix Audio Element S 1650.jpg', 'image/jpeg', 5384, 'Matrix Audio Element S', 1650.00, 1, 1, NULL, NULL, '2023-05-25 01:59:41', '2023-05-25 01:59:41'),
(35, 'VE Zen LL', 've-zen-ll', 'http://localhost:8000/storage/images/SH6OZfhQtdl9YK5f/VE Zen LL 79.jpg', 'image/jpeg', 12306, 'Venture Electronics. Arguably one of, if not the most iconic earbud maker, at least in this present time. They have a wide range of products – from the legendary “hyperbudget” Monk series, up to the TOTL Sun. I have here the VE Zen LL (standard), selling for 69.80 USD, with an impedance rating of 150 ohms. It can be ordered with either a 3.5mm, 2.5mm, or 4.4mm jack. There’s an SLQ version as well, with the same driver but different colorway and cable, selling for 128 USD.', 69.80, 1, 1, NULL, NULL, '2023-05-25 02:01:31', '2023-05-27 08:56:48'),
(36, 'Audio-Technica-ATH-M50x', 'audio-technica-ath-m50x', 'http://localhost:8000/storage/images/1PrAbP25Qb7quw8N/Audio-Technica-ATH-M50x 124.jpg', 'image/jpeg', 76976, 'About this item\r\nCritically acclaimed sonic performance praised by top audio engineers and pro audio reviewers\r\nProprietary 45 millimeter large aperture drivers with rare earth magnets and copper clad aluminum wire voice coils\r\nExceptional clarity throughout an extended frequency range with deep accurate bass response\r\nCircumaural design contours around the ears for excellent sound isolation in loud environments\r\n90 degree swiveling earcups for easy one ear monitoring and professional grade earpad and headband material delivers more durability and comfort\r\nNote: Products with electrical plugs are designed for use in the US. Outlets and voltage differ internationally and this product may require an adapter or converter for use in your destination. Please check compatibility before purchasing.', 124.00, 1, 1, NULL, NULL, '2023-05-25 02:01:44', '2023-05-27 01:52:40'),
(37, 'Beyerdynamic DT 990 Pro 250 ohms', 'beyerdynamic-dt-990-pro-250-ohms', 'http://localhost:8000/storage/images/bqn9R8vvNRxbv03p/beyerdynamic-dt-990-pro-250-ohms 159.jpg', 'image/jpeg', 23058, 'THE STUDIO \r\nLEGENDS\r\nFor decades now, professional users all around the world have placed their trust in our classic range: DT 770/880/990 PRO. These benchmark-setting studio headphones, available in three different models, boast extremely detailed resolution and very transparent sound.\r\n\r\nThe DT 990 PRO headphones is the range’s open-back model offering impressive spaciousness.', 159.00, 1, 1, NULL, NULL, '2023-05-25 02:03:20', '2023-05-27 01:15:47');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `is_admin`) VALUES
(1, 'Admin', 'admin@example.com', '2023-05-25 01:29:55', '$2y$10$W8Fa55P9NpFf8gHuhIn2I.tN0CzChVT5r6nfp7O3Fy1qLVVQJcqLe', NULL, '2023-05-25 01:29:55', '2023-05-25 01:29:55', 1),
(2, 'test123', 'test123@example.com', '2023-05-25 10:40:08', '$2y$10$RBNIfZY53TQgdmkDBbyFuuQm9/Gfk68FOFEfHDPuRxzqsSOLALhuK', NULL, '2023-05-25 10:09:38', '2023-05-25 10:40:08', 0),
(3, 'test1234', 'test1234@example.com', NULL, '$2y$10$tcsGR/h69ZtBwcXH6pYFCuGh8HUcICp/7VtYLWZdY4MK/6RIaB1BK', NULL, '2023-05-25 10:46:56', '2023-05-25 10:46:56', 0),
(4, 'sasha zarada', 'powerby@example.com', NULL, '$2y$10$ay0t3XtjJQYSCluyZfMUx.7KbZlGxU5BZTxXjXKddGWXuoScko4B2', 'fEaZ1thRsEOcWKja8RrvKrk8NzKoj2wAmePGFzmwZlWrh6QqtVZ71zLA3ih8', '2023-05-26 04:50:49', '2023-05-26 05:22:18', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_addresses_customer_id_foreign` (`customer_id`),
  ADD KEY `customer_addresses_country_code_foreign` (`country_code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_order_id_foreign` (`order_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD CONSTRAINT `customer_addresses_country_code_foreign` FOREIGN KEY (`country_code`) REFERENCES `countries` (`code`),
  ADD CONSTRAINT `customer_addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
