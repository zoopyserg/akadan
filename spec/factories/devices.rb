FactoryBot.define do
  factory :device do
    name { "Hoolahoop Phone 9" }
    price { 99.95 }
    nfc { true }
    screen { 'LCD' }
    review { 'http://somereview.com/' }
    wireless_charging { false }
    ul_wild_life_extreme_benchmark { 123 }
    ul_sling_shot_extreme_opengl_benchmark { 124 }
    ul_sling_shot_extreme_vulkan_benchmark { 125 }
    ul_sling_shot_extreme_unlimited_benchmark { 126 }
    ul_sling_shot_benchmark { 127 }
    ul_sling_shot_unlimited_benchmark { 128 }
    ul_wild_life_performance_benchmark { 129 }
    ul_wild_life_unlimited_benchmark { 130 }
    ul_work_2_0_performance_benchmark { 131 }
    ul_work_2_0_battery_life_benchmark { 132 }
    ul_computer_vision_benchmark { 133 }
    ul_storage_benchmark { 134 }
    ul_work_performance_benchmark { 135 }
    ul_work_battery_life_benchmark { 136 }
  end

  trait :cheap_good do
    price { 99.95 }
    ul_wild_life_extreme_benchmark { 123 }
    ul_sling_shot_extreme_opengl_benchmark { 124 }
    ul_sling_shot_extreme_vulkan_benchmark { 125 }
    ul_sling_shot_extreme_unlimited_benchmark { 126 }
    ul_sling_shot_benchmark { 127 }
    ul_sling_shot_unlimited_benchmark { 128 }
    ul_wild_life_performance_benchmark { 129 }
    ul_wild_life_unlimited_benchmark { 130 }
    ul_work_2_0_performance_benchmark { 131 }
    ul_work_2_0_battery_life_benchmark { 132 }
    ul_computer_vision_benchmark { 133 }
    ul_storage_benchmark { 134 }
    ul_work_performance_benchmark { 135 }
    ul_work_battery_life_benchmark { 136 }
  end

  trait :brick do
    price { 9.95 }
    ul_wild_life_extreme_benchmark { 222123 }
    ul_sling_shot_extreme_opengl_benchmark { 222124 }
    ul_sling_shot_extreme_vulkan_benchmark { 222125 }
    ul_sling_shot_extreme_unlimited_benchmark { 222126 }
    ul_sling_shot_benchmark { 222127 }
    ul_sling_shot_unlimited_benchmark { 222128 }
    ul_wild_life_performance_benchmark { 222129 }
    ul_wild_life_unlimited_benchmark { 222130 }
    ul_work_2_0_performance_benchmark { 222131 }
    ul_work_2_0_battery_life_benchmark { 222132 }
    ul_computer_vision_benchmark { 222133 }
    ul_storage_benchmark { 222134 }
    ul_work_performance_benchmark { 222135 }
    ul_work_battery_life_benchmark { 222136 }
  end
end
