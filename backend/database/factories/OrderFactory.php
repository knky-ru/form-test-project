<?php

namespace Database\Factories;

use App\Models\Order;
use Illuminate\Database\Eloquent\Factories\Factory;

class OrderFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Order::class;

    /**
     * Define the model's default state.
     *
     * @return array
     * @throws \Exception
     */
    public function definition()
    {
        $statuses = Order::STATUSES;
        $dates = $this->getRandomTimestamps();
        return [
            'name' => $this->faker->unique()->sentence,
            'status' => array_rand($statuses, 1),
            'created_at' => $dates['created_at'],
            'updated_at' => $dates['updated_at'],
        ];
    }

    private function getRandomTimestamps($backwardDays = -800)
    {
        $backwardCreatedDays = rand($backwardDays, 0);
        $backwardUpdatedDays = rand($backwardCreatedDays + 1, 0);

        return [
            'created_at' => \Carbon\Carbon::now()->addDays($backwardCreatedDays)->addMinutes(rand(0, 60 * 23))->addSeconds(rand(0, 60)),
            'updated_at' => \Carbon\Carbon::now()->addDays($backwardUpdatedDays)->addMinutes(rand(0, 60 * 23))->addSeconds(rand(0, 60)),
        ];
    }
}
