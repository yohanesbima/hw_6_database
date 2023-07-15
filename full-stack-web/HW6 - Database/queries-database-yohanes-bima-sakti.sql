CREATE TABLE "barang" (
  "id" SERIAL PRIMARY KEY,
  "nama_barang" VARCHAR,
  "harga" INT,
  "stok" INT,
  "kategori_id" INT,
  "created_at" TIMESTAMPTZ DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE "kategori_barang" (
  "id" SERIAL PRIMARY KEY,
  "nama_kategori" VARCHAR,
  "created_at" TIMESTAMPTZ DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ DEFAULT NOW()
);
ALTER TABLE "kategori_barang" ADD FOREIGN KEY ("id") REFERENCES "barang" ("kategori_id");

-- Select data barang
SELECT * FROM barang;

-- Insert data barang
INSERT INTO barang (id, nama_barang, harga, stok, kategori_id)
VALUES (1, 'Mainan Anak', 100000, 10, 1);

-- Update data barang
UPDATE barang
SET nama_barang = 'Mobil Remote Kontrol', updated_at = NOW()
WHERE id = 1;



-- Select data kategori_barang
SELECT * FROM kategori_barang;

-- Insert data kategori_barang
INSERT INTO kategori_barang (id, nama_kategori)
VALUES (1, 'Mainan');

-- Update data kategori_barang
UPDATE kategori_barang
SET nama_kategori = 'Mainan Anak', updated_at = NOW()
WHERE id = 1;


-- sample_query output
SELECT b.nama_barang, b.harga, k.nama_kategori
FROM barang b
JOIN kategori_barang k ON b.kategori_id = k.id;
