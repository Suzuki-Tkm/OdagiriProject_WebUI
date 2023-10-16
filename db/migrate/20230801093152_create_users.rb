class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name , null: false
      t.boolean :administrator , null: false , default: false

      t.string :astringency_Fresh #年齢(渋み or フレッシュ)
      t.string :personality #性格は温厚か冷酷か(warm or cool)
      t.string :painting_taste #画風（手入力）
      t.string :portrait_LandscapePainting #1人で何かを達成するより人と関わって何かを達成する方が好きである(人物画 or 風景画)
      t.string :nature_population #あなたは都会に住みたいですか(自然物 or 人工物)
      t.string :tradition_revolution #同じことを繰り返すのが好きか(伝統 or 革命)
      t.string :conservative_active #いつも同じような人と付き合うことが多い(保守的 or 活動的)
      t.string :bus_question #あなたはバス停にいます。次のバスまであと30分。近くには時間をつぶせそうなお店がいくつかあります。あなたならどうしますか？(A：本屋に行く(知識、自分を持っている)B：コンビニに行く(洗脳されやすい、軽い)C：コーヒーショップに行く(落ち着き、冷静)D：そのままバス停で待つ(一途))

      t.string :image_recognition #画像認識
      t.string :voice_recognition_brightness #音声認識(明るさ)
      t.string :voice_recognition_weather #音声認識(天気)

      t.string :pictureStyle #画風選択
      t.timestamps
    end
  end
end
