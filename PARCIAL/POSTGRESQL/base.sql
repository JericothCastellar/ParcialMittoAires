PGDMP                       }            bd_jericoth_castellar_xyz    17.4    17.4 <    v           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            w           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            x           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            y           1262    16570    bd_jericoth_castellar_xyz    DATABASE        CREATE DATABASE bd_jericoth_castellar_xyz WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'es-ES';
 )   DROP DATABASE bd_jericoth_castellar_xyz;
                     postgres    false            �            1259    16634    clientes    TABLE     f  CREATE TABLE public.clientes (
    id_cliente integer NOT NULL,
    extras_seleccionados integer,
    precio_individual numeric(10,2) NOT NULL,
    fecha_de_entrega date,
    matricula character varying(20) NOT NULL,
    stock integer,
    metodo_de_pago character varying(50),
    nombre character varying(100) NOT NULL,
    direccion text NOT NULL,
    tipo_de_cliente character varying(50),
    nif character varying(100),
    id_vendedor character varying(100),
    CONSTRAINT clientes_extras_seleccionados_check CHECK ((extras_seleccionados >= 0)),
    CONSTRAINT clientes_stock_check CHECK ((stock >= 0))
);
    DROP TABLE public.clientes;
       public         heap r       postgres    false            �            1259    16633    clientes_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.clientes_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.clientes_id_cliente_seq;
       public               postgres    false    226            z           0    0    clientes_id_cliente_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.clientes_id_cliente_seq OWNED BY public.clientes.id_cliente;
          public               postgres    false    225            �            1259    16572    concesionario    TABLE     �   CREATE TABLE public.concesionario (
    id_concesionario integer NOT NULL,
    nombre character varying(100),
    direccion text
);
 !   DROP TABLE public.concesionario;
       public         heap r       postgres    false            �            1259    16571 "   concesionario_id_concesionario_seq    SEQUENCE     �   CREATE SEQUENCE public.concesionario_id_concesionario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.concesionario_id_concesionario_seq;
       public               postgres    false    218            {           0    0 "   concesionario_id_concesionario_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.concesionario_id_concesionario_seq OWNED BY public.concesionario.id_concesionario;
          public               postgres    false    217            �            1259    16681    extras_opcionales    TABLE     �  CREATE TABLE public.extras_opcionales (
    id_elemento integer NOT NULL,
    precio numeric(10,2) NOT NULL,
    disponibles integer NOT NULL,
    nombre character varying(100) NOT NULL,
    stock integer NOT NULL,
    modelo character varying(100) NOT NULL,
    CONSTRAINT extras_opcionales_disponibles_check CHECK ((disponibles >= 0)),
    CONSTRAINT extras_opcionales_stock_check CHECK ((stock >= 0))
);
 %   DROP TABLE public.extras_opcionales;
       public         heap r       postgres    false            �            1259    16680 !   extras_opcionales_id_elemento_seq    SEQUENCE     �   CREATE SEQUENCE public.extras_opcionales_id_elemento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.extras_opcionales_id_elemento_seq;
       public               postgres    false    230            |           0    0 !   extras_opcionales_id_elemento_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.extras_opcionales_id_elemento_seq OWNED BY public.extras_opcionales.id_elemento;
          public               postgres    false    229            �            1259    16621    historial_de_ventas    TABLE     @  CREATE TABLE public.historial_de_ventas (
    id_venta integer NOT NULL,
    fecha date NOT NULL,
    rendimiento double precision NOT NULL,
    satisfaccion_del_cliente integer,
    nif character varying(100),
    CONSTRAINT historial_de_ventas_satisfaccion_del_cliente_check CHECK ((satisfaccion_del_cliente >= 0))
);
 '   DROP TABLE public.historial_de_ventas;
       public         heap r       postgres    false            �            1259    16620     historial_de_ventas_id_venta_seq    SEQUENCE     �   CREATE SEQUENCE public.historial_de_ventas_id_venta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.historial_de_ventas_id_venta_seq;
       public               postgres    false    224            }           0    0     historial_de_ventas_id_venta_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.historial_de_ventas_id_venta_seq OWNED BY public.historial_de_ventas.id_venta;
          public               postgres    false    223            �            1259    16654 
   inventario    TABLE     �   CREATE TABLE public.inventario (
    numero_de_bastidor character varying(20) NOT NULL,
    direccion text NOT NULL,
    disponibilidad boolean NOT NULL,
    nif character varying(100)
);
    DROP TABLE public.inventario;
       public         heap r       postgres    false            �            1259    16580    servicio_oficial    TABLE       CREATE TABLE public.servicio_oficial (
    nif character varying(100) NOT NULL,
    nombre character varying(100),
    direccion text,
    precio_de_venta integer,
    id_concesionario integer,
    CONSTRAINT servicio_oficial_precio_de_venta_check CHECK ((precio_de_venta >= 0))
);
 $   DROP TABLE public.servicio_oficial;
       public         heap r       postgres    false            �            1259    16666 	   vehiculos    TABLE     �  CREATE TABLE public.vehiculos (
    modelo character varying(100) NOT NULL,
    precio numeric(10,2) NOT NULL,
    descuentos numeric(10,2) DEFAULT 0.00,
    potencia_fiscal integer NOT NULL,
    cilindrado integer NOT NULL,
    tipo character varying(50) NOT NULL,
    "tamaño" character varying(50) NOT NULL,
    capacidad integer NOT NULL,
    combustible character varying(20) NOT NULL,
    estado character varying(50) NOT NULL,
    numero_de_bastidor character varying(20) NOT NULL,
    CONSTRAINT vehiculos_capacidad_check CHECK ((capacidad >= 0)),
    CONSTRAINT vehiculos_cilindrado_check CHECK ((cilindrado >= 0)),
    CONSTRAINT vehiculos_potencia_fiscal_check CHECK ((potencia_fiscal >= 0))
);
    DROP TABLE public.vehiculos;
       public         heap r       postgres    false            �            1259    16608 
   vendedores    TABLE     �   CREATE TABLE public.vendedores (
    nif character varying(100) NOT NULL,
    nombre character varying(100) NOT NULL,
    direccion text NOT NULL,
    id_transaccion integer
);
    DROP TABLE public.vendedores;
       public         heap r       postgres    false            �            1259    16594    venta_y_transaccion    TABLE     �  CREATE TABLE public.venta_y_transaccion (
    id_transaccion integer NOT NULL,
    motivo_de_compra text,
    matricula character varying(20) NOT NULL,
    garantia integer,
    fecha_y_hora timestamp without time zone NOT NULL,
    origen character varying(100),
    nif character varying(100) NOT NULL,
    id_cliente integer,
    CONSTRAINT venta_y_transaccion_garantia_check CHECK ((garantia >= 0))
);
 '   DROP TABLE public.venta_y_transaccion;
       public         heap r       postgres    false            �            1259    16593 &   venta_y_transaccion_id_transaccion_seq    SEQUENCE     �   CREATE SEQUENCE public.venta_y_transaccion_id_transaccion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.venta_y_transaccion_id_transaccion_seq;
       public               postgres    false    221            ~           0    0 &   venta_y_transaccion_id_transaccion_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.venta_y_transaccion_id_transaccion_seq OWNED BY public.venta_y_transaccion.id_transaccion;
          public               postgres    false    220            �           2604    16637    clientes id_cliente    DEFAULT     z   ALTER TABLE ONLY public.clientes ALTER COLUMN id_cliente SET DEFAULT nextval('public.clientes_id_cliente_seq'::regclass);
 B   ALTER TABLE public.clientes ALTER COLUMN id_cliente DROP DEFAULT;
       public               postgres    false    225    226    226            �           2604    16575    concesionario id_concesionario    DEFAULT     �   ALTER TABLE ONLY public.concesionario ALTER COLUMN id_concesionario SET DEFAULT nextval('public.concesionario_id_concesionario_seq'::regclass);
 M   ALTER TABLE public.concesionario ALTER COLUMN id_concesionario DROP DEFAULT;
       public               postgres    false    217    218    218            �           2604    16684    extras_opcionales id_elemento    DEFAULT     �   ALTER TABLE ONLY public.extras_opcionales ALTER COLUMN id_elemento SET DEFAULT nextval('public.extras_opcionales_id_elemento_seq'::regclass);
 L   ALTER TABLE public.extras_opcionales ALTER COLUMN id_elemento DROP DEFAULT;
       public               postgres    false    230    229    230            �           2604    16624    historial_de_ventas id_venta    DEFAULT     �   ALTER TABLE ONLY public.historial_de_ventas ALTER COLUMN id_venta SET DEFAULT nextval('public.historial_de_ventas_id_venta_seq'::regclass);
 K   ALTER TABLE public.historial_de_ventas ALTER COLUMN id_venta DROP DEFAULT;
       public               postgres    false    224    223    224            �           2604    16597 "   venta_y_transaccion id_transaccion    DEFAULT     �   ALTER TABLE ONLY public.venta_y_transaccion ALTER COLUMN id_transaccion SET DEFAULT nextval('public.venta_y_transaccion_id_transaccion_seq'::regclass);
 Q   ALTER TABLE public.venta_y_transaccion ALTER COLUMN id_transaccion DROP DEFAULT;
       public               postgres    false    221    220    221            o          0    16634    clientes 
   TABLE DATA           �   COPY public.clientes (id_cliente, extras_seleccionados, precio_individual, fecha_de_entrega, matricula, stock, metodo_de_pago, nombre, direccion, tipo_de_cliente, nif, id_vendedor) FROM stdin;
    public               postgres    false    226   9U       g          0    16572    concesionario 
   TABLE DATA           L   COPY public.concesionario (id_concesionario, nombre, direccion) FROM stdin;
    public               postgres    false    218   V       s          0    16681    extras_opcionales 
   TABLE DATA           d   COPY public.extras_opcionales (id_elemento, precio, disponibles, nombre, stock, modelo) FROM stdin;
    public               postgres    false    230   V       m          0    16621    historial_de_ventas 
   TABLE DATA           j   COPY public.historial_de_ventas (id_venta, fecha, rendimiento, satisfaccion_del_cliente, nif) FROM stdin;
    public               postgres    false    224   W       p          0    16654 
   inventario 
   TABLE DATA           X   COPY public.inventario (numero_de_bastidor, direccion, disponibilidad, nif) FROM stdin;
    public               postgres    false    227   SW       h          0    16580    servicio_oficial 
   TABLE DATA           e   COPY public.servicio_oficial (nif, nombre, direccion, precio_de_venta, id_concesionario) FROM stdin;
    public               postgres    false    219   �W       q          0    16666 	   vehiculos 
   TABLE DATA           �   COPY public.vehiculos (modelo, precio, descuentos, potencia_fiscal, cilindrado, tipo, "tamaño", capacidad, combustible, estado, numero_de_bastidor) FROM stdin;
    public               postgres    false    228   X       k          0    16608 
   vendedores 
   TABLE DATA           L   COPY public.vendedores (nif, nombre, direccion, id_transaccion) FROM stdin;
    public               postgres    false    222   �X       j          0    16594    venta_y_transaccion 
   TABLE DATA           �   COPY public.venta_y_transaccion (id_transaccion, motivo_de_compra, matricula, garantia, fecha_y_hora, origen, nif, id_cliente) FROM stdin;
    public               postgres    false    221   @Y                  0    0    clientes_id_cliente_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.clientes_id_cliente_seq', 5, true);
          public               postgres    false    225            �           0    0 "   concesionario_id_concesionario_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.concesionario_id_concesionario_seq', 5, true);
          public               postgres    false    217            �           0    0 !   extras_opcionales_id_elemento_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.extras_opcionales_id_elemento_seq', 5, true);
          public               postgres    false    229            �           0    0     historial_de_ventas_id_venta_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.historial_de_ventas_id_venta_seq', 5, true);
          public               postgres    false    223            �           0    0 &   venta_y_transaccion_id_transaccion_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.venta_y_transaccion_id_transaccion_seq', 5, true);
          public               postgres    false    220            �           2606    16643    clientes clientes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id_cliente);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public                 postgres    false    226            �           2606    16579     concesionario concesionario_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.concesionario
    ADD CONSTRAINT concesionario_pkey PRIMARY KEY (id_concesionario);
 J   ALTER TABLE ONLY public.concesionario DROP CONSTRAINT concesionario_pkey;
       public                 postgres    false    218            �           2606    16688 (   extras_opcionales extras_opcionales_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.extras_opcionales
    ADD CONSTRAINT extras_opcionales_pkey PRIMARY KEY (id_elemento);
 R   ALTER TABLE ONLY public.extras_opcionales DROP CONSTRAINT extras_opcionales_pkey;
       public                 postgres    false    230            �           2606    16627 ,   historial_de_ventas historial_de_ventas_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.historial_de_ventas
    ADD CONSTRAINT historial_de_ventas_pkey PRIMARY KEY (id_venta);
 V   ALTER TABLE ONLY public.historial_de_ventas DROP CONSTRAINT historial_de_ventas_pkey;
       public                 postgres    false    224            �           2606    16660    inventario inventario_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_pkey PRIMARY KEY (numero_de_bastidor);
 D   ALTER TABLE ONLY public.inventario DROP CONSTRAINT inventario_pkey;
       public                 postgres    false    227            �           2606    16587 &   servicio_oficial servicio_oficial_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.servicio_oficial
    ADD CONSTRAINT servicio_oficial_pkey PRIMARY KEY (nif);
 P   ALTER TABLE ONLY public.servicio_oficial DROP CONSTRAINT servicio_oficial_pkey;
       public                 postgres    false    219            �           2606    16674    vehiculos vehiculos_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.vehiculos
    ADD CONSTRAINT vehiculos_pkey PRIMARY KEY (modelo);
 B   ALTER TABLE ONLY public.vehiculos DROP CONSTRAINT vehiculos_pkey;
       public                 postgres    false    228            �           2606    16614    vendedores vendedores_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.vendedores
    ADD CONSTRAINT vendedores_pkey PRIMARY KEY (nif);
 D   ALTER TABLE ONLY public.vendedores DROP CONSTRAINT vendedores_pkey;
       public                 postgres    false    222            �           2606    16602 ,   venta_y_transaccion venta_y_transaccion_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.venta_y_transaccion
    ADD CONSTRAINT venta_y_transaccion_pkey PRIMARY KEY (id_transaccion);
 V   ALTER TABLE ONLY public.venta_y_transaccion DROP CONSTRAINT venta_y_transaccion_pkey;
       public                 postgres    false    221            �           2606    16649 "   clientes clientes_id_vendedor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_id_vendedor_fkey FOREIGN KEY (id_vendedor) REFERENCES public.vendedores(nif) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_id_vendedor_fkey;
       public               postgres    false    4801    222    226            �           2606    16644    clientes clientes_nif_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_nif_fkey FOREIGN KEY (nif) REFERENCES public.servicio_oficial(nif) ON DELETE SET NULL;
 D   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_nif_fkey;
       public               postgres    false    219    4797    226            �           2606    16689 /   extras_opcionales extras_opcionales_modelo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.extras_opcionales
    ADD CONSTRAINT extras_opcionales_modelo_fkey FOREIGN KEY (modelo) REFERENCES public.vehiculos(modelo) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.extras_opcionales DROP CONSTRAINT extras_opcionales_modelo_fkey;
       public               postgres    false    228    230    4809            �           2606    16628 0   historial_de_ventas historial_de_ventas_nif_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.historial_de_ventas
    ADD CONSTRAINT historial_de_ventas_nif_fkey FOREIGN KEY (nif) REFERENCES public.vendedores(nif) ON DELETE SET NULL;
 Z   ALTER TABLE ONLY public.historial_de_ventas DROP CONSTRAINT historial_de_ventas_nif_fkey;
       public               postgres    false    4801    224    222            �           2606    16661    inventario inventario_nif_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_nif_fkey FOREIGN KEY (nif) REFERENCES public.servicio_oficial(nif) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.inventario DROP CONSTRAINT inventario_nif_fkey;
       public               postgres    false    219    4797    227            �           2606    16588 7   servicio_oficial servicio_oficial_id_concesionario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.servicio_oficial
    ADD CONSTRAINT servicio_oficial_id_concesionario_fkey FOREIGN KEY (id_concesionario) REFERENCES public.concesionario(id_concesionario) ON DELETE CASCADE;
 a   ALTER TABLE ONLY public.servicio_oficial DROP CONSTRAINT servicio_oficial_id_concesionario_fkey;
       public               postgres    false    218    4795    219            �           2606    16675 +   vehiculos vehiculos_numero_de_bastidor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vehiculos
    ADD CONSTRAINT vehiculos_numero_de_bastidor_fkey FOREIGN KEY (numero_de_bastidor) REFERENCES public.inventario(numero_de_bastidor) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.vehiculos DROP CONSTRAINT vehiculos_numero_de_bastidor_fkey;
       public               postgres    false    228    4807    227            �           2606    16615 )   vendedores vendedores_id_transaccion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendedores
    ADD CONSTRAINT vendedores_id_transaccion_fkey FOREIGN KEY (id_transaccion) REFERENCES public.venta_y_transaccion(id_transaccion) ON DELETE SET NULL;
 S   ALTER TABLE ONLY public.vendedores DROP CONSTRAINT vendedores_id_transaccion_fkey;
       public               postgres    false    4799    221    222            �           2606    16603 0   venta_y_transaccion venta_y_transaccion_nif_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.venta_y_transaccion
    ADD CONSTRAINT venta_y_transaccion_nif_fkey FOREIGN KEY (nif) REFERENCES public.servicio_oficial(nif);
 Z   ALTER TABLE ONLY public.venta_y_transaccion DROP CONSTRAINT venta_y_transaccion_nif_fkey;
       public               postgres    false    219    221    4797            o   �   x�m�;�0E��el ��H��@�O�41� �,�u�1l@������4H!zB@
��BwIc`�
����ܩlǸ���3�9���ɒ�
���b��E&�	�,��n�C����6��+~���ن!��ЇLEޠ�2l=�k�_�w��m�U*y���Q�7��j�O�nK��<�E�����Ip����Q�t:��^�e/�hm      g   [   x�3��*M��tN��I5�2�H=�1�5�2��I,-�r��s�J2�3�s�L8�R�Ks2�2!�ɉ��\���@�@%�Q���|�=... ��!%      s   r   x�3�440�30�4�t�,J�8�=��8�`¾�%�E qgװ �.cNc��_f	X��38�я˄��8��P?GO.SNS��sfNf^JQ��kEIQ"HQp��cP(W�  �      m   B   x�U̻�0њ�%����a���R)�U�8�O�5���ƂѻJ�:�k�
��j���~�R���/3H0      p   9   x�3�tN��I5�,�4�2�p�8�8��L c��1�)�c�p�A8�@�)W� Q�      h   c   x�-�A
� F��?�	������Fą 
��]��~�Y��Xk�������'2X�I��q�(E!���QK+���#�]�J�����5y:"� @�      q   �   x���O
�@��7��2�h;���31j���f��`�������6��y?�1��PJmJ�ac�S��+%��?o�7V��n��@���X
�C[u�H��%Oql]̰n*m������
.i�s1���,�".8�J��m�#ɵ{�����֟g>�ː��%*���!��fB�Niz      k   \   x�3��J-.-�tN��I5266�4�2�����,τ�E���9�R�RRS���`�&��\&��%E�0L8M�L9}���"�@!S�=... G�      j   w   x��ͽ
�0���;W����dq�1��B�C�tk�X���ށ����^]5CY}�n�"���B�� R��>�{=0�^R�f(�q�|�z@�4���3F�Ϗ�#�S<<=�D���5      