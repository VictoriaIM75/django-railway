CREATE TABLE `accounts_customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `accounts_customer` (`id`, `name`, `phone`, `email`, `date_created`) VALUES (1, 'victoria', '0000000000', 'vic@gmail.com', '2025-05-05 05:03:50.451000');
INSERT INTO `accounts_customer` (`id`, `name`, `phone`, `email`, `date_created`) VALUES (2, 'Ana Rojas', '1', 'anarojas@gmail.com', '2025-05-05 18:38:39.449000');
INSERT INTO `accounts_customer` (`id`, `name`, `phone`, `email`, `date_created`) VALUES (3, 'Luis Perez', '2', 'luisperez@gmail.com', '2025-05-05 18:39:23.111000');
INSERT INTO `accounts_customer` (`id`, `name`, `phone`, `email`, `date_created`) VALUES (4, 'Jorge Claros', '888888888888', 'jclaros@gmail.com', '2025-05-05 18:39:38.070000');

CREATE TABLE `accounts_opcion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `texto` varchar(200) NOT NULL,
  `es_correcta` tinyint(1) NOT NULL,
  `pregunta_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_opcion_pregunta_id_3c8fbdbf` (`pregunta_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `accounts_opcion` (`id`, `texto`, `es_correcta`, `pregunta_id`) VALUES (1, 'respuesta11', 0, 1);
INSERT INTO `accounts_opcion` (`id`, `texto`, `es_correcta`, `pregunta_id`) VALUES (2, 'respuesta2', 1, 1);
INSERT INTO `accounts_opcion` (`id`, `texto`, `es_correcta`, `pregunta_id`) VALUES (3, 'respuesta21', 0, 2);
INSERT INTO `accounts_opcion` (`id`, `texto`, `es_correcta`, `pregunta_id`) VALUES (4, 'respuesta22', 0, 2);
INSERT INTO `accounts_opcion` (`id`, `texto`, `es_correcta`, `pregunta_id`) VALUES (5, 'respuesta411', 1, 7);
INSERT INTO `accounts_opcion` (`id`, `texto`, `es_correcta`, `pregunta_id`) VALUES (6, 'respuesta412', 1, 7);
INSERT INTO `accounts_opcion` (`id`, `texto`, `es_correcta`, `pregunta_id`) VALUES (23, 'r54', 1, 13);
INSERT INTO `accounts_opcion` (`id`, `texto`, `es_correcta`, `pregunta_id`) VALUES (22, 'r52', 0, 13);
INSERT INTO `accounts_opcion` (`id`, `texto`, `es_correcta`, `pregunta_id`) VALUES (21, 'r52', 0, 13);
INSERT INTO `accounts_opcion` (`id`, `texto`, `es_correcta`, `pregunta_id`) VALUES (20, 'r51', 0, 13);
INSERT INTO `accounts_opcion` (`id`, `texto`, `es_correcta`, `pregunta_id`) VALUES (16, 'respuesta421', 0, 4);
INSERT INTO `accounts_opcion` (`id`, `texto`, `es_correcta`, `pregunta_id`) VALUES (15, 'respuesta13', 0, 1);
INSERT INTO `accounts_opcion` (`id`, `texto`, `es_correcta`, `pregunta_id`) VALUES (17, 'respuesta23', 0, 2);
INSERT INTO `accounts_opcion` (`id`, `texto`, `es_correcta`, `pregunta_id`) VALUES (18, 'respuesta24', 1, 2);
INSERT INTO `accounts_opcion` (`id`, `texto`, `es_correcta`, `pregunta_id`) VALUES (19, 'respuesta113', 0, 3);

CREATE TABLE `accounts_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_order_customer_id_23c59287` (`customer_id`),
  KEY `accounts_order_product_id_83d789e2` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `accounts_order` (`id`, `date_created`, `status`, `customer_id`, `product_id`, `note`) VALUES (4, '2025-05-06 03:54:47.605000', 'Delivered', 4, 2, NULL);
INSERT INTO `accounts_order` (`id`, `date_created`, `status`, `customer_id`, `product_id`, `note`) VALUES (5, '2025-05-06 03:55:12.264000', 'Delivered', 1, 3, NULL);
INSERT INTO `accounts_order` (`id`, `date_created`, `status`, `customer_id`, `product_id`, `note`) VALUES (6, '2025-05-06 03:55:31.277000', 'Pending', 1, 1, NULL);
INSERT INTO `accounts_order` (`id`, `date_created`, `status`, `customer_id`, `product_id`, `note`) VALUES (7, '2025-05-06 03:56:09.266000', 'Pending', 2, 2, NULL);
INSERT INTO `accounts_order` (`id`, `date_created`, `status`, `customer_id`, `product_id`, `note`) VALUES (8, '2025-05-06 04:56:52.682000', 'Pending', 1, 1, NULL);
INSERT INTO `accounts_order` (`id`, `date_created`, `status`, `customer_id`, `product_id`, `note`) VALUES (9, '2025-05-06 04:57:00.832000', 'Out for delivery', 1, 2, NULL);
INSERT INTO `accounts_order` (`id`, `date_created`, `status`, `customer_id`, `product_id`, `note`) VALUES (10, '2025-05-06 05:08:19.772000', 'Pending', 2, 1, NULL);
INSERT INTO `accounts_order` (`id`, `date_created`, `status`, `customer_id`, `product_id`, `note`) VALUES (11, '2025-05-06 05:08:19.784000', 'Delivered', 2, 1, 'hello world');
INSERT INTO `accounts_order` (`id`, `date_created`, `status`, `customer_id`, `product_id`, `note`) VALUES (12, '2025-05-06 16:47:56.977000', 'Pending', 4, 2, NULL);
INSERT INTO `accounts_order` (`id`, `date_created`, `status`, `customer_id`, `product_id`, `note`) VALUES (13, '2025-05-06 16:47:56.989000', 'Delivered', 4, 2, NULL);
INSERT INTO `accounts_order` (`id`, `date_created`, `status`, `customer_id`, `product_id`, `note`) VALUES (14, '2025-05-06 16:47:56.996000', 'Delivered', 4, 1, 'hola hola');

CREATE TABLE `accounts_participante` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `materia` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_participante_usuario_id_02ef420e` (`usuario_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `accounts_participante` (`id`, `nombre`, `materia`, `fecha`, `usuario_id`) VALUES (1, 'victoria iriarte montaño', 'intru3', '2025-05-19', 14);
INSERT INTO `accounts_participante` (`id`, `nombre`, `materia`, `fecha`, `usuario_id`) VALUES (2, 'victoria iriarte montaño', 'intru3', '2025-05-19', 1);
INSERT INTO `accounts_participante` (`id`, `nombre`, `materia`, `fecha`, `usuario_id`) VALUES (3, 'victoria iriarte montaño', 'intru3', '2025-05-19', 1);
INSERT INTO `accounts_participante` (`id`, `nombre`, `materia`, `fecha`, `usuario_id`) VALUES (4, 'victoria iriarte montaño 2', 'intru3', '2025-05-19', 1);
INSERT INTO `accounts_participante` (`id`, `nombre`, `materia`, `fecha`, `usuario_id`) VALUES (5, 'victoria iriarte montaño 3', 'intru2', '2025-05-15', 1);
INSERT INTO `accounts_participante` (`id`, `nombre`, `materia`, `fecha`, `usuario_id`) VALUES (6, 'victoria iriarte montaño 4', 'intru2', '2025-05-19', 1);
INSERT INTO `accounts_participante` (`id`, `nombre`, `materia`, `fecha`, `usuario_id`) VALUES (7, 'victoria iriarte montaño', 'intru2', '2025-05-19', 1);
INSERT INTO `accounts_participante` (`id`, `nombre`, `materia`, `fecha`, `usuario_id`) VALUES (8, 'victoria iriarte montaño', 'intru2', '2025-05-19', 1);
INSERT INTO `accounts_participante` (`id`, `nombre`, `materia`, `fecha`, `usuario_id`) VALUES (9, 'victoria iriarte montaño 2', 'intru3', '2025-05-21', 1);

CREATE TABLE `accounts_pregunta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `texto` varchar(300) NOT NULL,
  `categoria` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `accounts_pregunta` (`id`, `texto`, `categoria`) VALUES (1, 'pregunta1c1d', 'Etapa 1');
INSERT INTO `accounts_pregunta` (`id`, `texto`, `categoria`) VALUES (2, 'pregunta2', 'Etapa 2');
INSERT INTO `accounts_pregunta` (`id`, `texto`, `categoria`) VALUES (3, 'pregunta1', 'Etapa 3');
INSERT INTO `accounts_pregunta` (`id`, `texto`, `categoria`) VALUES (4, 'pregunta 2', 'Etapa 4');
INSERT INTO `accounts_pregunta` (`id`, `texto`, `categoria`) VALUES (5, 'pregunta31', 'Etapa 3');
INSERT INTO `accounts_pregunta` (`id`, `texto`, `categoria`) VALUES (6, 'pregunta32', 'Etapa 3');
INSERT INTO `accounts_pregunta` (`id`, `texto`, `categoria`) VALUES (7, 'pregunta41', 'Etapa 4');
INSERT INTO `accounts_pregunta` (`id`, `texto`, `categoria`) VALUES (8, 'pregunta42', 'Etapa 4');
INSERT INTO `accounts_pregunta` (`id`, `texto`, `categoria`) VALUES (9, 'pregunta51', 'Etapa 5');
INSERT INTO `accounts_pregunta` (`id`, `texto`, `categoria`) VALUES (10, 'pregunta52', 'Etapa 5');
INSERT INTO `accounts_pregunta` (`id`, `texto`, `categoria`) VALUES (13, 'pregunta51', 'Etapa 5');

CREATE TABLE `accounts_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `category` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `accounts_product` (`id`, `name`, `price`, `category`, `description`, `date_created`) VALUES (1, 'Producto1', 50.0e0, 'Indoor', '*', '2025-05-05 18:40:58.156000');
INSERT INTO `accounts_product` (`id`, `name`, `price`, `category`, `description`, `date_created`) VALUES (2, 'Producto2', 100.0e0, 'Indoor', NULL, '2025-05-05 18:42:55.158000');
INSERT INTO `accounts_product` (`id`, `name`, `price`, `category`, `description`, `date_created`) VALUES (3, 'Producto3', 10.0e0, 'Out Door', NULL, '2025-05-05 18:43:18.188000');

CREATE TABLE `accounts_product_tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_product_tags_product_id_tag_id_f558f1ef_uniq` (`product_id`,`tag_id`),
  KEY `accounts_product_tags_product_id_2d1c4b64` (`product_id`),
  KEY `accounts_product_tags_tag_id_f4ba4ec3` (`tag_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `accounts_product_tags` (`id`, `product_id`, `tag_id`) VALUES (1, 1, 2);
INSERT INTO `accounts_product_tags` (`id`, `product_id`, `tag_id`) VALUES (2, 1, 3);
INSERT INTO `accounts_product_tags` (`id`, `product_id`, `tag_id`) VALUES (3, 2, 1);
INSERT INTO `accounts_product_tags` (`id`, `product_id`, `tag_id`) VALUES (4, 2, 3);
INSERT INTO `accounts_product_tags` (`id`, `product_id`, `tag_id`) VALUES (5, 3, 1);

CREATE TABLE `accounts_respuesta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `es_correcta` tinyint(1) NOT NULL,
  `opcion_elegida_id` bigint NOT NULL,
  `participante_id` bigint NOT NULL,
  `pregunta_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_respuesta_opcion_elegida_id_991e0fc1` (`opcion_elegida_id`),
  KEY `accounts_respuesta_participante_id_c814cb37` (`participante_id`),
  KEY `accounts_respuesta_pregunta_id_f192c025` (`pregunta_id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (1, 0, 1, 1, 1);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (2, 0, 2, 1, 1);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (3, 0, 3, 1, 2);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (4, 0, 4, 1, 2);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (5, 0, 6, 1, 7);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (6, 0, 1, 3, 1);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (7, 0, 4, 3, 2);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (8, 1, 6, 3, 7);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (15, 0, 1, 5, 1);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (10, 0, 1, 4, 1);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (11, 1, 3, 4, 2);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (12, 0, 16, 4, 4);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (13, 1, 6, 4, 7);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (16, 0, 17, 5, 2);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (17, 0, 19, 5, 3);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (18, 0, 16, 5, 4);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (19, 1, 5, 5, 7);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (20, 1, 2, 6, 1);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (21, 0, 3, 6, 2);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (22, 0, 19, 6, 3);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (23, 0, 16, 6, 4);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (24, 1, 6, 6, 7);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (25, 0, 1, 7, 1);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (26, 0, 17, 7, 2);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (27, 0, 19, 7, 3);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (28, 0, 16, 7, 4);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (29, 1, 5, 7, 7);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (30, 1, 23, 7, 13);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (31, 0, 1, 8, 1);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (32, 0, 17, 8, 2);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (33, 0, 19, 8, 3);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (34, 0, 16, 8, 4);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (35, 1, 6, 8, 7);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (36, 1, 23, 8, 13);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (37, 0, 1, 9, 1);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (38, 0, 3, 9, 2);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (39, 0, 19, 9, 3);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (40, 0, 16, 9, 4);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (41, 1, 6, 9, 7);
INSERT INTO `accounts_respuesta` (`id`, `es_correcta`, `opcion_elegida_id`, `participante_id`, `pregunta_id`) VALUES (42, 1, 23, 9, 13);

CREATE TABLE `accounts_resultado` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha` datetime(6) NOT NULL,
  `puntaje_total` decimal(5,2) NOT NULL,
  `participante_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `participante_id` (`participante_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `accounts_resultado` (`id`, `fecha`, `puntaje_total`, `participante_id`) VALUES (1, '2025-05-19 06:26:11.448701', 33.33, 8);
INSERT INTO `accounts_resultado` (`id`, `fecha`, `puntaje_total`, `participante_id`) VALUES (2, '2025-05-19 06:26:54.563225', 33.33, 9);

CREATE TABLE `accounts_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `accounts_tag` (`id`, `name`) VALUES (1, 'Tag1');
INSERT INTO `accounts_tag` (`id`, `name`) VALUES (2, 'Tag2');
INSERT INTO `accounts_tag` (`id`, `name`) VALUES (3, 'Tag3');

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `auth_group` (`id`, `name`) VALUES (1, 'administrador');
INSERT INTO `auth_group` (`id`, `name`) VALUES (2, 'operador');
INSERT INTO `auth_group` (`id`, `name`) VALUES (3, 'servicio');

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (25, 'Can add customer', 7, 'add_customer');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (26, 'Can change customer', 7, 'change_customer');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (27, 'Can delete customer', 7, 'delete_customer');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (28, 'Can view customer', 7, 'view_customer');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (29, 'Can add order', 8, 'add_order');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (30, 'Can change order', 8, 'change_order');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (31, 'Can delete order', 8, 'delete_order');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (32, 'Can view order', 8, 'view_order');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (33, 'Can add product', 9, 'add_product');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (34, 'Can change product', 9, 'change_product');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (35, 'Can delete product', 9, 'delete_product');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (36, 'Can view product', 9, 'view_product');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (37, 'Can add tag', 10, 'add_tag');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (38, 'Can change tag', 10, 'change_tag');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (39, 'Can delete tag', 10, 'delete_tag');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (40, 'Can view tag', 10, 'view_tag');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (41, 'Can add participante', 11, 'add_participante');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (42, 'Can change participante', 11, 'change_participante');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (43, 'Can delete participante', 11, 'delete_participante');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (44, 'Can view participante', 11, 'view_participante');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (45, 'Can add pregunta', 12, 'add_pregunta');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (46, 'Can change pregunta', 12, 'change_pregunta');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (47, 'Can delete pregunta', 12, 'delete_pregunta');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (48, 'Can view pregunta', 12, 'view_pregunta');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (49, 'Can add respuesta', 13, 'add_respuesta');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (50, 'Can change respuesta', 13, 'change_respuesta');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (51, 'Can delete respuesta', 13, 'delete_respuesta');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (52, 'Can view respuesta', 13, 'view_respuesta');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (53, 'Can add opcion', 14, 'add_opcion');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (54, 'Can change opcion', 14, 'change_opcion');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (55, 'Can delete opcion', 14, 'delete_opcion');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (56, 'Can view opcion', 14, 'view_opcion');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (57, 'Can add resultado', 15, 'add_resultado');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (58, 'Can change resultado', 15, 'change_resultado');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (59, 'Can delete resultado', 15, 'delete_resultado');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (60, 'Can view resultado', 15, 'view_resultado');

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES (1, 'pbkdf2_sha256$1000000$GckJCzH27iJ7FP1nbCxXpd$kKXYXEWcYencyxFD8xep+OUyut7TL/YHLh/zAA299J0=', '2025-05-19 04:37:15.543160', 1, 'vikir', '', '', 'vik@gmail.com', 1, 1, '2025-05-05 04:41:20.275000');
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES (2, 'pbkdf2_sha256$870000$iylm2V7qEYi5WXBPH6BxgH$7hr5sqjEfufn+VtId0aLqv2xHZ0Aomd6iSSANNaw+W0=', '2025-05-07 16:03:55.017000', 0, 'usuario1', '', '', 'u1@gmail.com', 0, 1, '2025-05-05 04:49:24');
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES (8, 'pbkdf2_sha256$870000$NpLSFgRJQAyMMkxI1rJkpo$THRjP4ko3gzrB9hyXnrds3aD0nQjGCBQtkog3rlNF2Q=', '2025-05-07 15:55:55.834000', 0, 'administrador1', '', '', '', 0, 1, '2025-05-07 12:57:23');
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES (9, 'pbkdf2_sha256$870000$ZZmrv89MzO73ErL2TK9JBn$Z1N07NbG/RZAtLZ8rrA7h4n/h5vU0wocXx31pcjeiY4=', '2025-05-08 04:57:19.989000', 0, 'servicio1', '', '', '', 0, 1, '2025-05-07 12:58:02');
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES (10, 'pbkdf2_sha256$870000$PZpuq49EuM7SP9obBE6uLO$XS1K8k1yZApttRCCl+Oo2G5Z67s0YrUzWce3fRKYNxM=', '2025-05-07 14:03:11.896000', 0, 'operador1', '', '', '', 0, 1, '2025-05-07 12:58:25');
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES (11, 'pbkdf2_sha256$1000000$D0ygPtCG4QDmdGaT3VNDcp$pntEUekDVoR4xh+fhJtCOVMhxgAMjfv1dp6AXQcWSik=', '2025-05-15 16:50:59.663405', 0, 'administrador2', '', '', 'ad2@gmail.com', 0, 1, '2025-05-07 13:32:52.544000');
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES (13, 'pbkdf2_sha256$1000000$8DahHPS2WVqszuxSZQYQo8$oy4zw2X9s0fbexkGDFcigpmpFm765333iVPqO8ETLPU=', '2025-05-15 16:53:37.325472', 0, 'operador2', '', '', 'op2@gmail.com', 0, 1, '2025-05-07 15:08:39.847000');
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES (14, 'pbkdf2_sha256$1000000$h4s7CJxtYU5EsXKC7DMtNn$ZwKPVhd3dH1f4W0eLn323s1WZyOKEX2GF5ivJsjsGnA=', '2025-05-20 02:17:06.073797', 0, 'servicio2', '', '', 's2@gmail.com', 0, 1, '2025-05-07 15:56:54.661000');
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES (16, 'pbkdf2_sha256$870000$IvOxN9uqB8lntlZrZ9RQhc$Iq4M/xmYX1+9Rpd8klueSIViJsAfkypcWdPdw47x/s8=', NULL, 0, 'administrador3', '', '', 'ad3@gmail.com', 0, 1, '2025-05-08 16:16:30.032000');
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES (17, 'pbkdf2_sha256$870000$YGBwD68QP1xzEjXIwtFhiu$CnvKez7EARAgJdEr2DZgSHbk5hednDIgNllWbVc3tJg=', '2025-05-08 16:31:07.077000', 0, 'usuario55', '', '', 'u5@gmail.com', 0, 1, '2025-05-08 16:28:19.285000');
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES (18, 'pbkdf2_sha256$870000$YzOJtThcFAQuw8MFtDvghk$5z5k/h5qc+L9XaepOOnjN59RgJJQqNKSJ7rFM7gUMxI=', '2025-05-08 17:06:57.400000', 0, 'prueba2', '', '', 'rmartinezs@univalle.edu', 0, 1, '2025-05-08 17:06:03.362000');
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES (19, 'pbkdf2_sha256$870000$l5omXD4Kp3mI6abC1bbENE$woMGbWtpPwZb4tziTbNSr6Gke39IQRDOQEiO4Hut984=', '2025-05-14 14:00:58.963593', 1, 'vikir1', '', '', '', 1, 1, '2025-05-14 14:00:20.301568');
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES (20, 'pbkdf2_sha256$1000000$5MW3LcfRn1vLxycOYBRCoM$hVJa+NIJAZTO61vttx7H2o3FDQjt4fycPj/syltfcFg=', NULL, 0, 'administrador4', '', '', 'ad44@gmail.com', 0, 1, '2025-05-14 20:56:47.911220');

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES (1, 2, 2);
INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES (2, 8, 1);
INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES (3, 9, 3);
INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES (4, 10, 2);
INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES (5, 11, 1);
INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES (6, 13, 2);
INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES (7, 14, 3);
INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES (8, 16, 1);
INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES (9, 17, 3);
INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES (10, 18, 2);
INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES (11, 20, 1);

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1, '2025-05-05 04:49:25.994000', '2', 'usuario1', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (2, '2025-05-05 04:49:52.453000', '2', 'usuario1', 2, '[]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (3, '2025-05-05 05:03:50.456000', '1', 'victoria', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (4, '2025-05-05 18:38:39.452000', '2', 'Ana Rojas', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (5, '2025-05-05 18:38:57.068000', '1', 'Tag1', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (6, '2025-05-05 18:39:01.801000', '2', 'Tag2', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (7, '2025-05-05 18:39:04.633000', '3', 'Tag3', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (8, '2025-05-05 18:39:23.113000', '3', 'Luis Perez', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (9, '2025-05-05 18:39:38.072000', '4', 'Jorge', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (10, '2025-05-05 18:40:58.164000', '1', 'Product object (1)', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (11, '2025-05-05 18:42:55.168000', '2', 'Producto2', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (12, '2025-05-05 18:43:18.193000', '3', 'Producto3', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (13, '2025-05-05 18:44:40.625000', '1', 'Order object (1)', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (14, '2025-05-05 18:45:10.172000', '2', 'Order object (2)', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (15, '2025-05-05 18:45:27.665000', '3', 'Order object (3)', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (16, '2025-05-05 19:56:30.614000', '3', 'Order object (3)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 8, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (17, '2025-05-05 19:56:49.061000', '2', 'Order object (2)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 8, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (18, '2025-05-06 01:51:23.997000', '4', 'Jorge', 2, '[]', 7, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (19, '2025-05-06 02:49:42.893000', '4', 'Jorge Claros', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Phone\"]}}]', 7, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (20, '2025-05-06 17:52:40.974000', '11', 'Producto1', 2, '[{\"changed\": {\"fields\": [\"Note\"]}}]', 8, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (21, '2025-05-06 17:52:48.403000', '14', 'Producto1', 2, '[{\"changed\": {\"fields\": [\"Note\"]}}]', 8, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (22, '2025-05-06 22:57:06.430000', '5', 'usuario4', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (23, '2025-05-07 12:54:26.251000', '1', 'administrador', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (24, '2025-05-07 12:55:00.205000', '2', 'operador', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (25, '2025-05-07 12:55:05.250000', '3', 'servicio', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (26, '2025-05-07 12:57:24.394000', '8', 'administrador1', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (27, '2025-05-07 12:57:42.630000', '8', 'administrador1', 2, '[]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (28, '2025-05-07 12:58:03.329000', '9', 'servicio1', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (29, '2025-05-07 12:58:11.476000', '9', 'servicio1', 2, '[]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (30, '2025-05-07 12:58:27.106000', '10', 'operador1', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (31, '2025-05-07 12:58:35.013000', '10', 'operador1', 2, '[]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (32, '2025-05-07 13:28:31.579000', '8', 'administrador1', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (33, '2025-05-07 13:28:39.791000', '8', 'administrador1', 2, '[]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (34, '2025-05-07 13:28:46.419000', '10', 'operador1', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (35, '2025-05-07 13:29:01.942000', '9', 'servicio1', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (36, '2025-05-19 04:37:36.800545', '1', 'Etapa1 - pregunta1c1', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (37, '2025-05-19 04:38:19.295617', '1', 'respuesta1', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (38, '2025-05-19 04:38:22.717877', '1', 'Respuesta object (1)', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (39, '2025-05-19 04:38:34.565132', '2', 'respuesta2', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (40, '2025-05-19 04:38:36.497089', '2', 'Respuesta object (2)', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (41, '2025-05-19 04:39:09.560996', '2', 'E2 - pregunta2', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (42, '2025-05-19 04:39:17.036281', '2', 'Etapa2 - pregunta2', 2, '[{\"changed\": {\"fields\": [\"Categoria\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (43, '2025-05-19 04:41:21.390303', '3', 'respuesta21', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (44, '2025-05-19 04:41:25.971541', '3', 'Respuesta object (3)', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (45, '2025-05-19 04:41:39.494505', '4', 'respuesta22', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (46, '2025-05-19 04:41:40.746640', '4', 'Respuesta object (4)', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (47, '2025-05-19 04:50:29.793284', '3', 'Etapa 3 - pregunta1', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (48, '2025-05-19 04:50:41.983905', '4', 'Etapa 4 - pregunta 2', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (49, '2025-05-19 04:51:01.070260', '2', 'Etapa 2 - pregunta2', 2, '[{\"changed\": {\"fields\": [\"Categoria\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (50, '2025-05-19 04:51:04.384786', '1', 'Etapa 1 - pregunta1c1', 2, '[{\"changed\": {\"fields\": [\"Categoria\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (51, '2025-05-19 04:56:03.322241', '2', 'victoria iriarte montaño - pregunta1c1', 2, '[]', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (52, '2025-05-19 04:56:32.117388', '5', 'Etapa 3 - pregunta31', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (53, '2025-05-19 04:56:40.034722', '6', 'Etapa 3 - pregunta32', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (54, '2025-05-19 04:56:45.933834', '7', 'Etapa 4 - pregunta41', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (55, '2025-05-19 04:56:52.430344', '8', 'Etapa 4 - pregunta42', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (56, '2025-05-19 04:56:57.833441', '9', 'Etapa 5 - pregunta51', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (57, '2025-05-19 04:57:10.546335', '10', 'Etapa 5 - pregunta52', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (58, '2025-05-19 04:57:38.902796', '5', 'respuesta411', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (59, '2025-05-19 04:57:54.446923', '6', 'respuesta412', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (60, '2025-05-19 04:57:59.053052', '5', 'victoria iriarte montaño - pregunta41', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (61, '2025-05-19 05:29:43.466468', '1', 'victoria iriarte montaño - pregunta1c1d', 2, '[]', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (62, '2025-05-19 05:29:59.183079', '3', 'victoria iriarte montaño - pregunta2', 2, '[]', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (63, '2025-05-19 05:30:27.327267', '11', 'Etapa 4 - pregunta 43', 2, '[]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (64, '2025-05-19 05:30:45.530801', '9', 'victoria iriarte montaño - pregunta 43', 1, '[{\"added\": {}}]', 13, 1);

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (7, 'accounts', 'customer');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (8, 'accounts', 'order');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (9, 'accounts', 'product');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (10, 'accounts', 'tag');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (11, 'accounts', 'participante');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (12, 'accounts', 'pregunta');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (13, 'accounts', 'respuesta');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (14, 'accounts', 'opcion');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (15, 'accounts', 'resultado');

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (1, 'accounts', '0001_initial', '2025-05-14 13:56:54.145346');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (2, 'accounts', '0002_order_product', '2025-05-14 13:56:54.173118');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (3, 'accounts', '0003_order_customer_order_product', '2025-05-14 13:56:54.309720');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (4, 'accounts', '0004_tag_order_tags', '2025-05-14 13:56:54.506144');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (5, 'accounts', '0005_remove_order_tags_product_tags', '2025-05-14 13:56:54.699878');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (6, 'accounts', '0006_order_note_alter_product_description', '2025-05-14 13:56:54.750335');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (7, 'contenttypes', '0001_initial', '2025-05-14 13:56:54.789439');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (8, 'auth', '0001_initial', '2025-05-14 13:56:55.469398');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (9, 'admin', '0001_initial', '2025-05-14 13:56:55.700783');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (10, 'admin', '0002_logentry_remove_auto_add', '2025-05-14 13:56:55.715143');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (11, 'admin', '0003_logentry_add_action_flag_choices', '2025-05-14 13:56:55.723704');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (12, 'contenttypes', '0002_remove_content_type_name', '2025-05-14 13:56:55.813114');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (13, 'auth', '0002_alter_permission_name_max_length', '2025-05-14 13:56:55.860238');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (14, 'auth', '0003_alter_user_email_max_length', '2025-05-14 13:56:55.912901');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (15, 'auth', '0004_alter_user_username_opts', '2025-05-14 13:56:55.920817');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (16, 'auth', '0005_alter_user_last_login_null', '2025-05-14 13:56:55.961616');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (17, 'auth', '0006_require_contenttypes_0002', '2025-05-14 13:56:55.961616');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (18, 'auth', '0007_alter_validators_add_error_messages', '2025-05-14 13:56:55.964497');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (19, 'auth', '0008_alter_user_username_max_length', '2025-05-14 13:56:56.007104');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (20, 'auth', '0009_alter_user_last_name_max_length', '2025-05-14 13:56:56.096858');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (21, 'auth', '0010_alter_group_name_max_length', '2025-05-14 13:56:56.144530');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (22, 'auth', '0011_update_proxy_permissions', '2025-05-14 13:56:56.157283');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (23, 'auth', '0012_alter_user_first_name_max_length', '2025-05-14 13:56:56.208927');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (24, 'sessions', '0001_initial', '2025-05-14 13:56:56.258048');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (25, 'accounts', '0007_pregunta_participante_opcion_respuesta', '2025-05-19 04:18:07.204470');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (26, 'accounts', '0008_alter_opcion_texto_alter_pregunta_categoria_and_more', '2025-05-19 06:21:03.979262');

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES ('zr334c83g1237e2s0t7bcjf7cofom96u', '.eJxVjMsOwiAQRf-FtSFlkAFduvcbyAwPqRpISrsy_ntD0oVu7znnfoSnbS1-62nxcxRXocTpd2MKr1QHiE-qjyZDq-sysxyKPGiX9xbT-3a4fweFehk1BpqcThE0gbEZXeZ8duQiZGCtglWARAqTZWREwGzsxQAiMhM78d0B8XM4Bw:1uGsFX:n7RjyduTkiYgLtx0HuICEOyjGm574I9P43ZgeWITPrM', '2025-06-02 04:37:15.551967');
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES ('a0m5fzfafqsislcajciva14gqtblz0bl', '.eJxVjMsOwiAQRf-FtSGFGfpw6d5vIMMMSNVAUtqV8d-1SRe6veec-1KetjX7rcXFz6LOalSn3y0QP2LZgdyp3KrmWtZlDnpX9EGbvlaJz8vh_h1kavlbgyWhLkGgmNAKocQegSfh0SaiwYGFiTpmAmMcpCEG0yOmEGyyyE69PxVyONU:1uCer5:ItuP487vwi-wCPVV021gVPWmSUKZUwysj0fDJXn5QHg', '2025-05-21 13:30:35.149000');
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES ('mk7lgpvmyfg8vjjpkfb3kta0dwr6l0jq', '.eJxVjDsOwjAQRO_iGlnrf0xJnzNYtneDA8iW4qRC3J1ESgHNFPPezJuFuK0lbJ2WMCO7MsEuv12K-Un1APiI9d54bnVd5sQPhZ-087EhvW6n-3dQYi_7Wju0MAhCklKrSSHsKcgr9EBgvEvKRKPQaqOdjQIQtaABs5wkGEHs8wXIMzc2:1uFBnG:VcNznnkK4viNZuAtBRk1IFC4u3al3VvwVxvAm1x58kw', '2025-05-28 13:05:06.374000');
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES ('0np4bl6j6jhhj4bt50p6774y7nhoca8x', '.eJxVjDsOwjAQBe_iGln-ZrOU9JzBWq_XJIASKU4qxN0hUgpo38y8l0q0rUPamixpLOqsbFCn3zETP2TaSbnTdJs1z9O6jFnvij5o09e5yPNyuH8HA7XhW1O0hiH2AFWMjV11aAtJrexBAELPXhxVhooheu8I0WFGDqbLvQmden8ABsI3wA:1uFImU:IAg1vDu4fAOcn4Uahgk0TIztm4B7IFuvLaj3YVVHtdA', '2025-05-28 20:32:46.273736');
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES ('aahh06454nkb8dj4bf05ofbv9kiaxqy5', '.eJxVjDsOwjAQBe_iGln-ZrOU9JzBWq_XJIASKU4qxN0hUgpo38y8l0q0rUPamixpLOqsbFCn3zETP2TaSbnTdJs1z9O6jFnvij5o09e5yPNyuH8HA7XhW1O0hiH2AFWMjV11aAtJrexBAELPXhxVhooheu8I0WFGDqbLvQmden8ABsI3wA:1uFIoB:L3-K6OSBC0UrWR0cTB6U_eS4zNs-uRoa2RTy-K8mHxs', '2025-05-28 20:34:31.964634');
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES ('vxgyghtq4b33yj1qsqryej8h44e4bsmk', '.eJxVjEEOwiAQRe_C2hCgAzou3XuGZmAGqRpISrsy3l2bdKHb_977LzXSupRx7TKPE6uzsqAOv2Ok9JC6Eb5TvTWdWl3mKepN0Tvt-tpYnpfd_Tso1Mu3RuMipgEte3CJ0MZjTpm9CSkIEHqEIBIERU6UwTsj7BiMhGCAeFDvDxG6OHE:1uHCXS:UhWTRobXi4svDyA3UIrauWpfXWBdfkimLlOTMpV-h04', '2025-06-03 02:17:06.082363');

