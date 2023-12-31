# frozen_string_literal: true

require 'terminal-table'

# Languages class
class Languages # rubocop:disable Metrics/ClassLength
  @languages = {
    'af' => 'Afrikaans',
    'sq' => 'Albanês',
    'am' => 'Amárico',
    'ar' => 'Árabe',
    'hy' => 'Armênio',
    'az' => 'Azerbaijão',
    'be' => 'Bielorrússia',
    'bel' => 'Bielorrússia',
    'bn' => 'Bengali',
    'bs' => 'Bósnio',
    'bg' => 'Búlgaro',
    'ca' => 'Catalão',
    'ceb' => 'Cebuano',
    'zh-CN' => 'Chinês (simplificado)',
    'zh-TW' => 'Chinês (tradicional)',
    'hr' => 'Croata',
    'cs' => 'Tcheco',
    'da' => 'Dinamarquês',
    'nl' => 'Holandês',
    'en' => 'Inglês',
    'et' => 'Estoniano',
    'tl' => 'Filipino',
    'fi' => 'Finlandês',
    'fr' => 'Francês',
    'fy' => 'Frísio',
    'gl' => 'Galego',
    'ka' => 'Georgiano',
    'de' => 'Alemão',
    'el' => 'Grego',
    'gu' => 'Guzerate',
    'ht' => 'crioulo haitiano',
    'ha' => 'Haúça',
    'he' => 'Hebraico',
    'hi' => 'Hindi',
    'hu' => 'Húngaro',
    'is' => 'Islandês',
    'ig' => 'Ibo',
    'id' => 'Indonésio',
    'ga' => 'Irlandês',
    'it' => 'Italiano',
    'ja' => 'Japonês',
    'kn' => 'Canadá',
    'kk' => 'Cazaque',
    'km' => 'Khmer',
    'ko' => 'Coreano',
    'lo' => 'Lao',
    'lv' => 'Letão',
    'lt' => 'Lituano',
    'lb' => 'luxemburguês',
    'mk' => 'Macedônio',
    'mg' => 'Malgaxe',
    'ms' => 'Malaio',
    'ml' => 'Malaiala',
    'mr' => 'Marata',
    'mn' => 'Mongol',
    'my' => 'Mianmar (birmanês)',
    'ne' => 'Nepalês',
    'nb' => 'Norueguês (Bokmål)',
    'no' => 'Norueguês',
    'or' => 'Odia (Oriya)',
    'ps' => 'pasto',
    'fa' => 'Persa',
    'pl' => 'Polonês',
    'pt' => 'Português',
    'pt-BR' => 'Português (Brasil)',
    'pt-PT' => 'Português (Portugal)',
    'pa' => 'Punjabi',
    'ro' => 'Romena',
    'ru' => 'Russo',
    'gd' => 'Gaélico Escocês',
    'sr' => 'Sérvio',
    'sd' => 'Sindi',
    'si' => 'Cingalês',
    'sk' => 'Eslovaco',
    'sl' => 'Esloveno',
    'so' => 'Somaliano',
    'es' => 'Espanhol',
    'su' => 'Sudanês',
    'sw' => 'suaíli',
    'sv' => 'Sueco',
    'ta' => 'Tâmil',
    'th' => 'Tailandês',
    'tr' => 'Turco',
    'uk' => 'Ucraniano',
    'ur' => 'Urdu',
    'uz' => 'Uzbeque',
    'vi' => 'Vietnamita',
    'cy' => 'Galês',
    'xh' => 'Xosa',
    'yi' => 'Iídiche',
    'yo' => 'iorubá',
    'zu' => 'Zulu'
  }

  def self.list
    @languages.map do |key, value|
      "#{key}: #{value}"
    end
  end

  def self.table
    lines = list.each_slice(5)

    table = Terminal::Table.new do |t|
      lines.each do |line|
        t.add_row line
      end
    end

    puts table
  end
end
