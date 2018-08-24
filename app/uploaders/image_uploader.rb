class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # 내 서버에 저장한다는 것
  # storage :fog
  # 외부 저장소에 저장한다는 것

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url(*args)
    cate_num = (model.category).to_i

    if cate_num <= 27  
      #기초 메이크업
      if cate_num <= 7
        return "/default/gicho_toner.png" if cate_num == 2
        return "/default/gicho_lotion.png" if cate_num == 3   
        return "/default/gicho_essence.png" if cate_num == 4
        return "/default/gicho_cream.png" if cate_num == 5
        return "/default/gicho_mist.png" if cate_num == 6
        return "/default/gicho_faceoil.png"
      #클렌징
      elsif cate_num <= 14
        return "/default/cleansing_foam.png" if cate_num == 9
        return "/default/cleansing_water.png" if cate_num == 10
        return "/default/cleansing_oil.png" if cate_num == 11
        return "/default/cleansing_cream.png" if cate_num == 12
        return "/default/cleansing_remover.png" if cate_num == 13
        return "/default/cleansing_scrub.png"
      #베이스메이크업-기초
      elsif cate_num <= 18
        return "/default/basemake_gicho_makebase.png" if cate_num == 17
        return "/default/basemake_gicho_primer.png"
      #베이스메이크업-피부톤
      elsif cate_num <= 23
        return "/default/basemake_skin_cushion.png" if cate_num == 20
        return "/default/basemake_skin_foundation.png" if cate_num == 21 
        return "/default/basemake_skin_bb.png" if cate_num == 22
        return "/default/basemake_skin_concealer.png" 
      #베이스메이크업-마무리
      else
        return "/default/basemake_final_powder.png" if cate_num == 25
        return "/default/basemake_final_shading.png" if cate_num == 26
        return "/default/basemake_final_fixer.png"
      end 
    else
      #색조메이크업-아이
      if cate_num <= 33
        return "/default/saekjo_eye_shadow.png" if cate_num == 30
        return "/default/saekjo_eye_liner.png" if cate_num == 31
        return "/default/saekjo_eye_brow.png" if cate_num == 32
        return "/default/saekjo_eye_mascara.png"
      #색조메이크업-립
      elsif cate_num <= 37
        return "/default/saekjo_lip_stick.png" if cate_num == 35
        return "/default/saekjo_lip_tint.png" if cate_num == 36
        return "/default/saekjo_lip_balm.png"
      #색조메이크업-블러셔
      elsif cate_num == 38
        return "/default/saekjo_blusher.png"
      #바디/헤어
      elsif cate_num <= 42
        return "/default/bodyhair_bodylotion.png" if cate_num == 40
        return "/default/bodyhair_handlotion.png" if cate_num == 41
        return "/default/bodyhair_hair.png" 
      #향수
      elsif cate_num == 43
        return "/default/perfume.png"
      #기타
      else
        return "/default/gita.png"
      end
    end 
  end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_fit: [75, 75]
  end
  version :modalthumb do
    process resize_to_fit: [100, 100]
  end
  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
