USE parcial1_dp;

CREATE TABLE video_metadata (
  video_id VARCHAR(20) DEFAULT NULL,
  title VARCHAR(140) DEFAULT NULL,
  link VARCHAR(500) DEFAULT NULL
);

CREATE TABLE video_stats (
  id varchar(20) DEFAULT NULL,
  viewCount int(11) DEFAULT NULL,
  likeCount int(11) DEFAULT NULL,
  dislikeCount int(11) DEFAULT NULL,
  favoriteCount int(11) DEFAULT NULL,
  commentCount int(11) DEFAULT NULL
);

CREATE TABLE videos (
  kind varchar(100) DEFAULT NULL,
  etag varchar(500) DEFAULT NULL,
  id text DEFAULT NULL,
  content_video_id varchar(45) DEFAULT NULL,
  date varchar(45) DEFAULT NULL
);


LOAD DATA INFILE '/home/parcial/academatica_videos_metadata.csv'
INTO TABLE video_metadata
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE '/home/parcial/academatica_video_stats.csv'
INTO TABLE video_stats
FIELDS TERMINATED BY '\,'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA INFILE '/home/parcial/academatica_videos.csv'
INTO TABLE videos
FIELDS TERMINATED BY '\,'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;